require_relative '../../repositories/car_repository'


describe 'CarRepository' do
  let(:json_path) { 'spec/input.json' }
  let(:car_repo) { CarRepository.new(json_path) }


  describe '#initialize' do
    it 'should have loaded existing rentals' do
      expect(car_repo.all.length).to eq 1
      expect(car_repo.all.first).to be_instance_of Car
    end
  end

  describe '#all' do
    it "should access all rentals" do
      expect(car_repo).to respond_to :all
      expect(car_repo.all).to be_a Array
      expect(car_repo.all.first).to be_instance_of Car
    end
  end
end
