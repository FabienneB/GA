# frozen_string_literal: true

require 'json'
require_relative '../models/car'

class CarRepository
  def initialize(input_data_path)
    @input_data_path = input_data_path
    @cars = []
    load_data
  end

  def all
    @cars
  end

  def find(id)
    @cars.find { |car| car.id == id }
  end

  private

  def load_data
    input_data = JSON.parse(File.read(@input_data_path))
    input_data['cars'].each do |car|
      # TODO rentals linked to a given car ?
      @cars << Car.new(
                        id: car['id'],
                        price_per_day: car['price_per_day'],
                        price_per_km: car['price_per_km']
                      )
    end
  end
end