
require_relative '../../models/car'

describe 'Car' do
  let(:car) { Car.new(id: 1, price_per_day: 1500, price_per_km: 8) }

  describe '#id' do
    it 'should return the id of the car' do
      expect(car).to respond_to :id
    end
  end

  describe '#price_per_day' do
    it 'should return the price_per_day of the car' do
      expect(car).to respond_to :price_per_day
    end
  end

  describe '#price_per_km' do
    it 'should return the price_per_km of the car' do
      expect(car).to respond_to :price_per_km
    end
  end

  describe '#initialize' do
    it 'should create a car with the given atts' do
      expect(car.price_per_day).to eq 1500
      expect(car.price_per_km).to eq 8
    end
  end
end
