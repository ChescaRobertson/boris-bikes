require 'bike.rb'

describe Bike do
  it "Bike responds to working" do
    expect(subject).to respond_to :working?
  end

  context 'reported bike broken' do
    it "reports bike as broken" do
      expect(subject).to respond_to :report_broken
    end
  end

  it 'can be reported broken' do
    subject.report_broken

    expect(subject).to be_broken
  end
end
