# frozen_string_literal: true

require 'json'
require_relative '../models/rental'

class RentalRepository
  def initialize(input_data_path)
    @input_data_path = input_data_path
    @rentals = []
    load_data
  end

  def all
    @rentals
  end

  def save_to_json(file_path, data)
    File.open(file_path, 'wb') do |file|
      file.write(JSON.pretty_generate({ 'rentals': data } ))
    end
  end

  private

  def load_data
    input_data = JSON.parse(File.read(@input_data_path))
    input_data['rentals'].each do |rental|
      @rentals << Rental.new(
                              id: rental['id'],
                              car_id: rental['car_id'],
                              start_date: rental['start_date'],
                              end_date: rental['end_date'],
                              distance: rental['distance']
                            )
    end
  end
end
