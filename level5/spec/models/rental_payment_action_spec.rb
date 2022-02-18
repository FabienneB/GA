require_relative '../../models/rental_price'
require_relative '../../models/rental_commission'
require_relative '../../models/rental_cash_data'
require_relative '../../models/rental_payment_action'
require_relative '../../models/rental'
require_relative '../../models/car'

describe 'RentalPaymentAction' do
  let(:car) { Car.new(id: 1, price_per_day: 2000, price_per_km: 10) }
  let(:rental) { Rental.new(id: 1, distance: 300, car_id: 1, start_date: '2015-03-31', end_date: '2015-04-01') }
  let(:rental_price) { RentalPrice.new(car: car, rental: rental) }
  let(:rental_commission) { RentalCommission.new(rental_price: rental_price) }
  let(:rental_cash_data) { RentalCashData.new(rental_price: rental_price, rental_commission: rental_commission) }
  let(:rental_payment_action) { RentalPaymentAction.new(rental_cash_data: rental_cash_data) }
  let(:actions) do
    [
      { amount: 6800, type: 'debit', who: 'driver' },
      { amount: 4760, type: 'credit', who: 'owner' },
      { amount: 1020, type: 'credit', who: 'insurance' },
      { amount: 200, type: 'credit', who: 'assistance' },
      { amount: 820, type: 'credit', who: 'drivy' },
    ]
  end

  describe '#id' do
    it 'should return rental id' do
      expect(rental_payment_action.id).to eq 1
    end
  end

  describe '#actions' do
    it 'should return rental price' do
      expect(rental_payment_action.actions).to match(actions)
    end
  end
end
