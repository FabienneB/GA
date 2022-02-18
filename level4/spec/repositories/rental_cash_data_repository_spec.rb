require_relative '../../repositories/car_repository'
require_relative '../../repositories/rental_cash_data_repository'
require_relative '../../repositories/rental_repository'
require 'pathname'


describe 'RentalCashDataRepository' do
  let(:input_json_path) { 'spec/input.json' }
  let(:car_repo) { CarRepository.new(input_json_path) }
  let(:rental_repo) { RentalRepository.new(input_json_path) }
  let(:rental_data_repo) { RentalCashDataRepository.new(car_repo, rental_repo) }

  describe '#initialize' do
    it 'should have loaded existing rental data' do
      expect(rental_data_repo.all.length).to eq 3
      expect(rental_data_repo.all.first).to be_instance_of Hash
    end
  end
end
