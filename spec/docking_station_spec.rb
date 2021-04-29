require 'Docking_Station.rb'

describe DockingStation do
  it "docking station responds to release bike" do
  expect(subject).to respond_to :release_bike
  end

  it "allows a bike to be docked" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "allows you to view bikes" do
    expect(subject).to respond_to :bike
  end

  it "Allows business to declare capacity instance variable" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "#initialization" do

    subject { DockingStation.new }
    let(:bike) { Bike.new }

    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error "Docking station full"
    end

  end

  describe '#release_bike' do 
  
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'checks if bike is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'This bike is broken'
    end

    it 'raises error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do 

    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq([bike])
    end

    it 'raises error when docking station is full' do
    subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end

  end
end