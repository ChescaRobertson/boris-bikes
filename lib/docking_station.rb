require_relative './bike.rb'

class DockingStation 
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY) 
    @bikes = []
    @capacity = capacity
  end

  def release_bike(bike=@bikes)
    fail 'No bikes available' if empty?
    fail 'This bike is broken' if broken?
    @bikes >> bikes
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
