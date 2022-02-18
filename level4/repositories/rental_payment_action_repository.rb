# frozen_string_literal: true

require 'json'
require_relative '../models/rental_price'
require_relative '../models/rental_commission'
require_relative '../models/rental_cash_data'
require_relative '../models/rental_payment_action'

class RentalPaymentActionRepository
  def initialize(car_repository, rental_repository)
    @car_repo = car_repository
    @rental_repo = rental_repository
    @rental_actions = []
    build_data
  end

  def all
    @rental_actions
  end

  private

  def build_data
    @rental_repo.all.each do |rental|
      car = @car_repo.find(rental.car_id)
      rental_price = RentalPrice.new(car: car, rental: rental)
      rental_commission = RentalCommission.new(rental_price: rental_price)
      rental_data = RentalCashData.new(rental_price: rental_price, rental_commission: rental_commission)
      rental_action = RentalPaymentAction.new(rental_cash_data: rental_data)
      @rental_actions << rental_action.attributes
    end
  end
end
