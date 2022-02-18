require_relative '../../models/rental_price'
require_relative '../../models/rental'
require_relative '../../models/car'

describe 'RentalPrice' do
  let(:car) { Car.new(id: 1, price_per_day: 2000, price_per_km: 10) }
  let(:rental) { Rental.new(id: 1, distance: 300, car_id: 1, start_date: '2015-03-31', end_date: '2015-04-01') }
  let(:rental_price) { RentalPrice.new(car: car, rental: rental) }

  describe '#car' do
    it 'should return an instance of Car' do
      expect(rental_price.car).to be_instance_of Car
      expect(rental_price.car).to eq(car)
    end
  end

  describe '#rental' do
    it 'should return an instance of Rental' do
      expect(rental_price.rental).to be_instance_of Rental
      expect(rental_price.rental).to eq(rental)
    end
  end

  describe '#price' do
    context 'with a decreasing duration price' do
      it 'return the right price of the rental' do
        expect(rental_price.price).to eq 6800
      end
    end

    context 'with a fixed duration price' do
      let(:rental_price) { RentalPrice.new(car: car, rental: rental, decreasing_duration_price: false) }
      it 'return the right price of the rental' do
        expect(rental_price.price).to eq 7000
      end
    end
  end
end
