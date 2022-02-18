require_relative '../../repositories/car_repository'
require_relative '../../repositories/rental_cash_data_repository'
require_relative '../../repositories/rental_repository'
require 'pathname'


describe 'RentalCashDataRepository' do
  let(:input_json_path) { "spec/input.json" }
  let(:output_json_path) { "spec/output.json" }
  let(:expected_output_json_path) { "spec/expected_output.json" }
  let(:expected_output_data) { File.read(expected_output_json_path) }
  let(:car_repo) { CarRepository.new(input_json_path) }
  let(:rental_repo) { RentalRepository.new(input_json_path) }
  let(:rental_data_repo) { RentalCashDataRepository.new(car_repo, rental_repo) }

  describe '#initialize' do
    it 'should have loaded existing rental data' do
      expect(rental_data_repo.all.length).to eq 3
      expect(rental_data_repo.all.first).to be_instance_of Hash
    end
  end

  describe '#save_to_json' do
    before(:each) { rental_data_repo.save_to_json(output_json_path) }
    it 'write data in output file' do
      expect(Pathname.new(output_json_path)).to exist
      expect(File.read(output_json_path)).to be_a String
      expect(JSON.parse(File.read(output_json_path))).to match(JSON.parse(expected_output_data))
    end
  end
end
