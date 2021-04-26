require 'docking_station'
require 'bike'

describe DockingStation do
  it "Docking Station responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "Releases working bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

end