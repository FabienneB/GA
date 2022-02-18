# frozen_string_literal: true
require 'pry'

class RentalCashData
  attr_reader :id, :driver_part, :owner_part, :insurance_part, :assistance_part, :drivy_part
  def initialize(params = {})
    @rental_price = params[:rental_price]
    @rental = @rental_price.rental
    @options = @rental.options
    @price = @rental_price.price
    @id = @rental.id
    @gps_price = @rental_price.gps_price
    @baby_seat_price = @rental_price.baby_seat_price
    @additional_insurance_price = @rental_price.additional_insurance_price
    @rental_commission = params[:rental_commission]
  end

  def owner_part
    (@price + @gps_price + @baby_seat_price - @rental_commission.commission).to_i
  end

  def insurance_part
    @rental_commission.insurance_fee
  end

  def assistance_part
    @assistance_fee = @rental_commission.assistance_fee
  end

  def drivy_part
    @rental_commission.drivy_fee + @additional_insurance_price
  end

  def driver_part
    @price + @gps_price + @baby_seat_price + @additional_insurance_price
  end
end

