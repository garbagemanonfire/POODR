class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(args) # 2. rim, tire)
    @chainring = args[:chainring]
    @cog = args[:cog]
    # 1. Ideal
    @wheel = args[:wheel]
    # 2. you could also instantiate wheel in the initialize method (not ideal)
    # @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    # 1. less dependent
    ratio * wheel.diameter
  end

  def ratio
    chainring/cog.to_f
  end

  # 3. you could create a wheel method to reduce dependency (not ideal)
  # def wheel
  # @wheel ||= Wheel.new(rim, tire)
  # end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::Pi
  end

end

#1. Gear expects a 'Duck' that konws 'diameter', using dependncy injection (ideal)
puts Gear.new(:chaingring => 52, :cog => 11, :wheel => Wheel.new(26, 1.5)).gear_inches
# 2. you could also instantiate wheel in the initialize method