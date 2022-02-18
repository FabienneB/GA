# frozen_string_literal: true

require_relative '../main'

require 'pry'

describe '#run' do
  let(:input_spec_path) { 'spec/input.json' }
  let(:output_spec_path) { 'spec/output.json' }
  let(:output_data) { File.read(output_spec_path) }
  let(:expected_output_json_path) { 'spec/expected_output.json' }
  let(:expected_output_data) { File.read(expected_output_json_path) }
  before { run(input_spec_path, output_spec_path) }
  it 'generates an output file with the car rental data' do
    expect(output_data).to be_a(String)
    parsed_output_data = JSON.parse(output_data)
    expect(parsed_output_data).to be_a(Hash)
    expect(parsed_output_data).to have_key('rentals')
    expect(JSON.parse(output_data)).to match(JSON.parse(expected_output_data))
  end
end
