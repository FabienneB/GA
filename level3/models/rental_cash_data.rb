# frozen_string_literal: true

class RentalCashData
  attr_reader :id, :price, :commission
  def initialize(params = {})
    @id = params[:rental_price].rental.id
    @price = params[:rental_price].price
    @commission = {
      insurance_fee: params[:rental_commission].insurance_fee,
      assistance_fee: params[:rental_commission].assistance_fee,
      drivy_fee: params[:rental_commission].drivy_fee
    }
  end

  def attributes
    {
      'id': @id,
      'price': @price,
      'commission': @commission
    }
  end
end

