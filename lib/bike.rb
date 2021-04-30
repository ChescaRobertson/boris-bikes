require_relative './docking_station.rb'

class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @broken = true
  end
  
  def broken?
    @broken
  end
end