# frozen_string_literal: true

class RentalPaymentAction
  attr_reader :id, :actions
  def initialize(params = {})
    @rental_cash_data = params[:rental_cash_data]
    @id = @rental_cash_data.id
    @actions = [driver_action, owner_action, insurance_action, assistance_action, drivy_action]
  end

  def attributes
    {
      'id': @id,
      'actions': @actions
    }
  end

  def driver_action
    {
      'who': 'driver',
      'type': 'debit',
      'amount': @rental_cash_data.price
    }
  end

  def owner_action
    {
      'who': 'owner',
      'type': 'credit',
      'amount': @rental_cash_data.owner_gain
    }
  end

  def insurance_action
    {
      'who': 'insurance',
      'type': 'credit',
      'amount': @rental_cash_data.insurance_fee
    }
  end

  def assistance_action
    {
      'who': 'assistance',
      'type': 'credit',
      'amount': @rental_cash_data.assistance_fee
    }
  end

  def drivy_action
    {
      'who': 'drivy',
      'type': 'credit',
      'amount': @rental_cash_data.drivy_fee
    }
  end
end
