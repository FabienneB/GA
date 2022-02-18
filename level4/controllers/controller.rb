# frozen_string_literal: true

class Controller
  def initialize(rental_repo, car_repo, rental_payment_action_repo, file_path)
    @rental_repo = rental_repo
    @car_repo = car_repo
    @rental_payment_action_repo = rental_payment_action_repo
    @file_path = file_path
  end

  def build_and_persist_data
    data = @rental_payment_action_repo.all
    @rental_repo.save_to_json(@file_path, data)
  end
end
