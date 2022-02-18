# frozen_string_literal: true

require 'json'
require 'date'

def cars(input_data)
  input_data['cars']
end

def rentals(input_data)
  input_data['rentals']
end

def compute_duration_price(price_per_day:, duration:)
  price_per_day * duration
end

def compute_distance_price(price_per_km:, distance:)
  price_per_km * distance
end

def rental_duration(start_date, end_date)
  (start_date..end_date).count
end

def compute_price(rental, car)
  duration = rental_duration(str_to_date(rental['start_date']), str_to_date(rental['end_date']))
  duration_price = compute_duration_price({ price_per_day: car['price_per_day'], duration: duration })
  distance_price = compute_distance_price({ price_per_km: car['price_per_km'], distance: rental['distance'] })
  duration_price + distance_price
end

def processed_input_data(filepath)
  JSON.parse(File.read(filepath))
end

def write_file_data(filepath, rentals_output_data)
  File.open(filepath, 'wb') do |file|
    file.write(JSON.pretty_generate(rentals_output_data))
  end
end

def str_to_date(str)
  DateTime.parse(str)
end

def run(inputpath, outputpath)
  input_data = processed_input_data(inputpath)
  cars = cars(input_data)
  rentals = rentals(input_data)

  rentals_output_data = rentals.each_with_object([]) do |rental, acc|
    acc << {
      'id': rental['id'],
      'price': compute_price(rental, cars.find { |car| car['id'] == rental['car_id'] })
    }
  end

  write_file_data(outputpath, { 'rentals': rentals_output_data })
end

run('data/input.json', 'data/output.json')

