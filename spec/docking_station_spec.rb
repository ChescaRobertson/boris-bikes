require 'docking_station'
require 'bike'

describe DockingStation do
  it "Docking Station responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "Docking station responds to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe "#release_bike" do
    # it "Releases working bike" do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    # it "releases a bike" do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect(subject.release_bike).to eq bike
    # end

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end


  describe "#dock" do
    # it "Docking station docks bike" do
    #   bike = Bike.new
    #   expect(subject.dock(bike)).to eq(bike)
    # end

    it "raises an error when the docking station is full" do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end

  end

end