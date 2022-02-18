# frozen_string_literal: true
require_relative 'repositories/rental_repository'
require_relative 'repositories/car_repository'
require_relative 'repositories/rental_cash_data_repository'


def run(inputpath, outputpath)
  car_repo = CarRepository.new(inputpath)
  rental_repo = RentalRepository.new(inputpath)
  RentalCashDataRepository.new(car_repo, rental_repo).save_to_json(outputpath)
end

run('data/input.json', 'data/output.json')
