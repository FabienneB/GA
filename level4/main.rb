# frozen_string_literal: true
require_relative 'repositories/rental_repository'
require_relative 'repositories/car_repository'
require_relative 'repositories/rental_payment_action_repository'
require_relative 'controllers/controller'


def run(inputpath, outputpath)
  car_repo = CarRepository.new(inputpath)
  rental_repo = RentalRepository.new(inputpath)
  rental_payment_repo = RentalPaymentActionRepository.new(car_repo, rental_repo)
  Controller.new(rental_repo, car_repo, rental_payment_repo, outputpath).build_and_persist_data
end

run('data/input.json', 'data/output.json')
