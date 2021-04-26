require 'bike.rb'

describe Bike do
  it "Bike responds to working" do
    expect(subject).to respond_to :working?
  end
end