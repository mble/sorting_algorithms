require 'spec_helper'

shared_examples 'a sorting algorithm' do |algorithm|
  it 'correctly sorts the array' do
    arr = []
    rand(5..30).times { arr << rand(1000) }
    expect(arr.send(algorithm)).to eq arr.sort
  end
end
