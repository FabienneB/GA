# frozen_string_literal: true

class RentalOption
  attr_reader :id, :rental_id, :type
  def initialize(params = {})
    @id = params[:id]
    @rental_id = params[:rental_id]
    @type = params[:type]
  end

  def day_price
    case @type
    when 'gps'
      500
    when 'baby_seat'
      200
    when 'additional_insurance'
      1000
    end
  end
end