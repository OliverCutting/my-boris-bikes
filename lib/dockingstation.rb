require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_accessor :capacity, :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.each do |bike|
      if bike.broken?
        raise 'No bikes available'
      else
        return @bikes.pop
        break
      end
    end 
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end