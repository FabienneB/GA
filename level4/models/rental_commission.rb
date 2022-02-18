# frozen_string_literal: true

class RentalCommission
  attr_reader :rental_price
  def initialize(params = {})
    @rental_price = params[:rental_price]
  end

  def commission
    0.3 * @rental_price.price
  end

  def insurance_fee
    (0.5 * commission).to_i
  end

  def assistance_fee
    @rental_price.rental.duration * 100
  end

  def drivy_fee
    (commission - insurance_fee - assistance_fee).to_i
  end
end
