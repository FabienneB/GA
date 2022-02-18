# frozen_string_literal: true

class RentalPrice
  attr_reader :price, :car, :rental
  def initialize(params = {})
    @decreasing_duration_price = params[:decreasing_duration_price].nil? ? true : params[:decreasing_duration_price]
    @rental = params[:rental]
    @car = params[:car]
  end

  def price
    (duration_price + distance_price).to_i
  end

  private

  def distance_price
    @car.price_per_km * @rental.distance
  end

  def duration_price
    return @car.price_per_day * @rental.duration unless @decreasing_duration_price

    return @car.price_per_day unless @rental.duration > 1

    compute_decreasing_price(@car.price_per_day, @rental.duration, 0, @rental.duration)
  end

  def compute_decreasing_price(price_per_day, duration, price, remaining_day)
    if (dist = remaining_day - 1).zero?
      price += price_per_day
    elsif (dist = remaining_day - 10).positive?
      price += dist * (price_per_day * 0.5)
      remaining_day -= dist
      compute_decreasing_price(price_per_day, duration, price, remaining_day)
    elsif (dist = remaining_day - 4).positive?
      price += dist * (price_per_day * 0.7)
      remaining_day -= dist
      compute_decreasing_price(price_per_day, duration, price, remaining_day)
    elsif (dist = remaining_day - 1).positive?
      price += dist * (price_per_day * 0.9)
      remaining_day -= dist
      compute_decreasing_price(price_per_day, duration, price, remaining_day)
    end
  end
end
