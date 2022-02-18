# frozen_string_literal: true

require 'json'
require_relative '../models/rental_option'

class RentalOptionRepository
  def initialize(input_data_path)
    @input_data_path = input_data_path
    @options = []
    load_data
  end

  def all
    @options
  end

  def where(rental_id)
    @options.select { |option| option.rental_id == rental_id }
  end

  private

  def load_data
    input_data = JSON.parse(File.read(@input_data_path))
    input_data['options'].each do |option|
      @options << RentalOption.new(
                        id: option['id'],
                        rental_id: option['rental_id'],
                        type: option['type']
                      )
    end
  end
end