# frozen_string_literal: true

require 'json'
require_relative '../models/rental_price'
require_relative '../models/rental_commission'
require_relative '../models/rental_cash_data'

class RentalCashDataRepository
  def initialize(car_repository, rental_repository)
    @car_repo = car_repository
    @rental_repo = rental_repository
    @rental_data = []
    build_data
  end

  def all
    @rental_data
  end

  def save_to_json(file_path)
    File.open(file_path, 'wb') do |file|
      file.write(JSON.pretty_generate({ 'rentals': @rental_data } ))
    end
  end

  private

  def build_data
    @rental_repo.all.each do |rental|
      car = @car_repo.find(rental.car_id)
      rental_price = RentalPrice.new(car: car, rental: rental)
      rental_commission = RentalCommission.new(rental_price: rental_price)
      rental_data = RentalCashData.new(rental_price: rental_price, rental_commission: rental_commission)
      @rental_data << rental_data.attributes
    end
  end
end
