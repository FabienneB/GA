require_relative '../../repositories/car_repository'
require_relative '../../repositories/rental_repository'
require_relative '../../repositories/rental_payment_action_repository'
require 'pathname'


describe 'RentalPaymentActionRepository' do
  let(:input_json_path) { 'spec/input.json' }
  let(:output_json_path) { 'spec/output.json' }
  let(:car_repo) { CarRepository.new(input_json_path) }
  let(:rental_repo) { RentalRepository.new(input_json_path) }
  let(:rental_actions_repo) { RentalPaymentActionRepository.new(car_repo, rental_repo) }

  describe '#initialize' do
    it 'should have loaded existing rental data' do
      expect(rental_actions_repo.all.length).to eq 3
      expect(rental_actions_repo.all.first).to be_instance_of Hash
    end
  end
end
