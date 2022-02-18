require_relative '../../models/rental_price'
require_relative '../../models/rental_commission'
require_relative '../../models/rental'
require_relative '../../models/car'

describe 'RentalCommission' do
  let(:car) { Car.new(id: 1, price_per_day: 2000, price_per_km: 10) }
  let(:rental) { Rental.new(id: 1, distance: 300, car_id: 1, start_date: '2015-03-31', end_date: '2015-04-01') }
  let(:rental_price) { RentalPrice.new(car: car, rental: rental) }
  let(:rental_commission) { RentalCommission.new(rental_price: rental_price) }


  describe '#insurance_fee' do
    it 'should return insurance_fee value' do
      expect(rental_commission.insurance_fee).to eq 1020
    end
  end

  describe '#assistance_fee' do
    it 'should return assistance_fee value' do
      expect(rental_commission.assistance_fee).to eq 200
    end
  end

  describe '#drivy_fee' do
    it 'should return drivy_fee value' do
      expect(rental_commission.drivy_fee).to eq 820
    end
  end
end
