require_relative '../../models/rental_price'
require_relative '../../models/rental_commission'
require_relative '../../models/rental_cash_data'
require_relative '../../models/rental'
require_relative '../../models/car'


describe 'RentalCashData' do
  let(:car) { Car.new(id: 1, price_per_day: 2000, price_per_km: 10) }
  let(:rental) { Rental.new(id: 1, distance: 300, car_id: 1, start_date: '2015-03-31', end_date: '2015-04-01') }
  let(:rental_price) { RentalPrice.new(car: car, rental: rental) }
  let(:rental_commission) { RentalCommission.new(rental_price: rental_price) }
  let(:rental_cash_data) { RentalCashData.new(rental_price: rental_price, rental_commission: rental_commission) }
  let(:rental_comm_value) { { 'insurance_fee': 1020,  'assistance_fee': 200, 'drivy_fee': 820 } }
  let(:atts) { { id: 1, price: 6800, commission: { insurance_fee: 1020, assistance_fee: 200, drivy_fee: 820 } } }


  describe '#id' do
    it 'should return rental id' do
      expect(rental_cash_data.id).to eq 1
    end
  end

  describe '#price' do
    it 'should return rental price' do
      expect(rental_cash_data.price).to eq 6800
    end
  end

  describe '#commission' do
    it 'should return rental commission' do
      expect(rental_cash_data.commission).to eq rental_comm_value
    end
  end

  describe '#attributes' do
    it 'should return data attributes' do
      expect(rental_cash_data.attributes).to be_instance_of Hash
      expect(rental_cash_data.attributes).to eq atts
    end
  end
end
