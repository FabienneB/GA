# frozen_string_literal: true

class RentalPrice
  attr_reader :price, :car, :rental, :gps_price, :baby_seat_price, :additional_insurance_price
  def initialize(params = {})
    # keyword argument ? default value for decreasing
    @decreasing_duration_price = params[:decreasing_duration_price].nil? ? true : params[:decreasing_duration_price]
    @rental = params[:rental]
    @car = params[:car]
    @options = @rental.options
    @rental_duration = @rental.duration
    @option_price = option_price
  end

  def price
    (duration_price + distance_price).to_i
  end

  def option_price
    @gps_price = @baby_seat_price = @additional_insurance_price = 0
    return 0 unless @options

    @rental.options.each do |option|
      tot = option.day_price * @rental_duration
      @gps_price += tot if option.id == 1
      @baby_seat_price += tot if option.id == 2
      @additional_insurance_price += tot if option.id == 3
    end

    @gps_price + @baby_seat_price + @additional_insurance_price
  end

  private

  def distance_price
    @car.price_per_km * @rental.distance
  end

  def duration_price
    return @car.price_per_day * @rental_duration unless @decreasing_duration_price

    return @car.price_per_day unless @rental_duration > 1

    compute_decreasing_price(@car.price_per_day, @rental_duration, 0, @rental_duration)
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
