#When gear is part of an external interface
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog  = cog
      @wheel = wheel
    end
#...
  end
end

#wrap the interface to protect yourself from changes
module GearWrapper
    def self.gears(args)
      SomeFramework::Gear.new(args[:chainring],
                              args[:cog],
                              args[:wheel])
    end
end

GearWrapper.gear(
    :chaingring => 52, :
    cog => 11,
    :wheel => Wheel.new(26, 1.5)).gear_inches)