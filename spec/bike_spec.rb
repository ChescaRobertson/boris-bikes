require 'bike.rb'

describe Bike do
  it "Bike responds to working" do
    expect(subject).to respond_to :working?
  end

  it "Allows user to report bike as broken" do
    expect(subject).to respond_to :broken?
  end

end