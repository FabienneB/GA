
require_relative '../../models/rental_option'

describe 'RentalOption' do
  let(:rental) { Rental.new(id: 1, distance: 280, car_id: 1, start_date: '2015-12-8', end_date: '2015-12-8') }
  let(:option) { RentalOption.new(id: 1, rental_id: 1, type: 'gps') }

  describe '#id' do
    it 'should return the id of the option' do
      expect(option).to respond_to :id
      expect(option.id).to eq 1
    end
  end

  describe '#day_price' do
    it 'should return the day_price of the option' do
      expect(option).to respond_to :day_price
      expect(option.day_price).to eq 500
    end
  end

  describe '#rental_id' do
    it 'should return the rental_id of the option' do
      expect(option).to respond_to :rental_id
      expect(option.rental_id).to eq 1
    end
  end

  describe 'type' do
    it 'should return the type of the option' do
      expect(option).to respond_to :type
      expect(option.type).to eq 'gps'
    end
  end
end
