require_relative '../../repositories/rental_price_repository'
require_relative '../../repositories/car_repository'
require_relative '../../repositories/rental_repository'
require 'pathname'


describe 'RentalPriceRepository' do
  let(:input_json_path) { "spec/input.json" }
  let(:output_json_path) { "spec/output.json" }
  let(:price_data) { { "rentals" => [{ 'id' => 1, 'price' => 3000 }, { 'id' => 2, 'price' => 6800 }, { 'id' => 3, 'price' => 27_800 } ] } }
  let(:car_repo) { CarRepository.new(input_json_path) }
  let(:rental_repo) { RentalRepository.new(input_json_path) }
  let(:rental_price_repo) { RentalPriceRepository.new(car_repo, rental_repo) }

  describe '#initialize' do
    it 'should have loaded existing rental prices' do
      expect(rental_price_repo.all.length).to eq 3
      expect(rental_price_repo.all.first).to be_instance_of RentalPrice
    end
  end

  describe '#save_to_json' do
    before(:each) { rental_price_repo.save_to_json(output_json_path) }
    it 'write data in output file' do
      expect(Pathname.new(output_json_path)).to exist
      expect(File.read(output_json_path)).to be_a String
      expect(JSON.parse(File.read(output_json_path))).to match(price_data)
    end
  end
end
