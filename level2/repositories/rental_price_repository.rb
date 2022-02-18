# frozen_string_literal: true

require 'json'
require_relative '../models/rental_price'

class RentalPriceRepository
  def initialize(car_repository, rental_repository)
    @car_repo = car_repository
    @rental_repo = rental_repository
    @rental_prices = []
    build_data
  end

  def all
    @rental_prices
  end

  def save_to_json(file_path)
    data = @rental_prices.each_with_object([]) do |rental_price, acc|
      acc << {
        'id': rental_price.rental.id,
        'price': rental_price.price
      }
    end
    File.open(file_path, 'wb') do |file|
      file.write(JSON.pretty_generate({ 'rentals': data } ))
    end
  end


  private

  def build_data
    @rental_repo.all.each do |rental|
      car = @car_repo.find(rental.car_id)
      @rental_prices << RentalPrice.new(car: car, rental: rental)
    end
  end
end
