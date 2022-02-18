# frozen_string_literal: true

require_relative '../main'

describe '#run' do
  let(:input_spec_path) { 'spec/input.json' }
  let(:output_spec_path) { 'spec/expected_output.json' }
  let(:output_data) { File.read(output_spec_path) }
  let(:expected_output_array) { [{ 'id' => 1, 'price' => 3000 }, { 'id' => 2, 'price' => 6_800 }, { 'id' => 3, 'price' => 27_800 }] }
  before { run(input_spec_path, output_spec_path) }
  it 'generates an output file with the car rental price data' do
    expect(output_data).to be_a(String)
    parsed_output_data = JSON.parse(output_data)
    expect(parsed_output_data).to be_a(Hash)
    expect(parsed_output_data).to have_key('rentals')
    expect(parsed_output_data['rentals']).to match_array(expected_output_array)
  end
end
