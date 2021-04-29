require 'bike.rb'

describe Bike do
  it "Bike responds to working" do
    expect(subject).to respond_to :working?
  end

  it "Reports bike as broken" do
    expect(subject).to respond_to :report_broken
  end

end