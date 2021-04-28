require 'docking_station'
require 'bike'

describe DockingStation do
  it "Docking Station responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "Docking station responds to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
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

  describe "#release_bike" do
    # it "Releases working bike" do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe "#dock" do
    it "raises an error when the docking station is full" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end

  end

end