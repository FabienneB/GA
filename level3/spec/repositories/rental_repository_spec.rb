require_relative '../../repositories/car_repository'
require_relative '../../repositories/rental_repository'


describe 'RentalRepository' do
  let(:json_path) { "spec/input.json" }
  let(:rental_repo) { RentalRepository.new(json_path) }

  describe '#initialize' do
    it 'should have loaded existing rentals' do
      expect(rental_repo.all.length).to eq 3
      expect(rental_repo.all.first).to be_instance_of Rental
    end
  end

  describe '#all' do
    it "should access all rentals" do
      expect(rental_repo).to respond_to :all
      expect(rental_repo.all).to be_a Array
      expect(rental_repo.all.first).to be_instance_of Rental
    end
  end
end
