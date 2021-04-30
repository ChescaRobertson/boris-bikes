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
    let(:bike) { double :bike }

    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error "Docking station full"
    end

  end

  describe '#release_bike' do 
    let(:bike) { double :bike }
    it "releases a working bikes" do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
    end

    it 'raises error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do 

    it "docks a bike" do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq([bike])
    end

    it 'raises error when docking station is full' do
    subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:Bike) }.to raise_error 'Docking station full'
    end

  end
end