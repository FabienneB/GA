require_relative '../../models/rental'

describe 'Rental' do
  let(:rental) { Rental.new(id: 1, distance: 280, car_id: 1, start_date: '2015-12-8', end_date: '2015-12-8') }
  let(:option) { RentalOption.new(id: 1, rental_id: 1, type: 'gps') }

  describe '#id' do
    it 'should return the id of the rental' do
      expect(rental).to respond_to :id
    end
  end

  describe '#duration' do
    it 'should return the duration of the rental' do
      expect(rental).to respond_to :duration
    end
  end

  describe '#initialize' do
    it 'should create a rental with the given attributes' do
      expect(rental.id).to eq 1
      expect(rental.duration).to eq 1
    end
  end
end
