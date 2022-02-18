# frozen_string_literal: true
require_relative 'repositories/rental_repository'
require_relative 'repositories/car_repository'
require_relative 'repositories/rental_option_repository'
require_relative 'controllers/controller'


def run(inputpath, outputpath)
  car_repo = CarRepository.new(inputpath)
  option_repo = RentalOptionRepository.new(inputpath)
  rental_repo = RentalRepository.new(inputpath, option_repo)
  Controller.new(rental_repo, car_repo, outputpath).build_and_persist_data
end

run('data/input.json', 'data/output.json')
