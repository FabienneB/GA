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

  describe '#id' do
    it 'should return rental id' do
      expect(rental_cash_data.id).to eq 1
    end
  end

  describe '#owner_part' do
    it 'should return owner_part' do
      expect(rental_cash_data.owner_part).to eq 4760
    end
  end

  describe '#insurance_part' do
    it 'should return insurance_part' do
      expect(rental_cash_data.insurance_part).to eq 1020
    end
  end

  describe '#assistance_part' do
    it 'should return assistance_part' do
      expect(rental_cash_data.assistance_part).to eq 200
    end
  end

  describe '#drivy_part' do
    it 'should return drivy_part' do
      expect(rental_cash_data.drivy_part).to eq 820
    end
  end

  describe '#driver_part' do
    it 'should return driver_part' do
      expect(rental_cash_data.driver_part).to eq 6800
    end
  end
end
