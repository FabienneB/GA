# frozen_string_literal: true
require 'date'

class Rental
  attr_reader :id, :duration, :car_id, :distance
  attr_accessor :options
  def initialize(params = {})
    @id = params[:id]
    @car_id = params[:car_id]
    @start_date = DateTime.parse(params[:start_date])
    @end_date = DateTime.parse(params[:end_date])
    @distance = params[:distance]
    @duration = (@start_date..@end_date).count
    @options = params[:options]
  end
end
