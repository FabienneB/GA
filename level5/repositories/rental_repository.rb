# frozen_string_literal: true

require 'json'
require_relative '../models/rental'
require_relative './rental_option_repository'

class RentalRepository
  def initialize(input_data_path, rental_option_repo)
    @input_data_path = input_data_path
    @rental_option_repo = rental_option_repo
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
      options = @rental_option_repo.where(rental['id'])
      @rentals << Rental.new(
                              id: rental['id'],
                              car_id: rental['car_id'],
                              start_date: rental['start_date'],
                              end_date: rental['end_date'],
                              distance: rental['distance'],
                              options: options
                            )
    end
  end
end
