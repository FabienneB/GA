# frozen_string_literal: true
require_relative '../models/rental_price'
require_relative '../models/rental_commission'
require_relative '../models/rental_cash_data'
require_relative '../models/rental_payment_action'

class Controller
  def initialize(rental_repo, car_repo, file_path)
    @rental_repo = rental_repo
    @car_repo = car_repo
    @file_path = file_path
  end

  def build_and_persist_data
    data = build_data
    @rental_repo.save_to_json(@file_path, data)
  end

  def build_data
    @rental_repo.all.each_with_object([]) do |rental, acc|
      car = @car_repo.find(rental.car_id)
      rental_price = RentalPrice.new(car: car, rental: rental)
      rental_commission = RentalCommission.new(rental_price: rental_price)
      rental_data = RentalCashData.new(rental_price: rental_price, rental_commission: rental_commission)
      rental_action = RentalPaymentAction.new(rental_cash_data: rental_data)
        acc << {
        id: rental.id,
        options: rental.options.map(&:type),
        actions: rental_action.actions
      }
    end
  end
end

