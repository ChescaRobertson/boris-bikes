require_relative 'bike.rb'

class DockingStation
  attr_reader :bike

  DEFAULT_CAPACITY = 20

  def initialize 
    @bikes = []
  end

  def release_bike()
    fail 'No bikes available' if empty?
    @bikes >> bikes
  end
  
  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end


end