class Gear
  attr_reader :chainring, :cog, :rim, :tire

# 1. You could specify defaults with or statement, but that is susceptible to issues with false boolean statements

  # def initialize(args)
  #   @chainring = args[:chainring] || 40
  #   @cog = args[:cog] || 18
  #   @wheel = args[:wheel]
  # end

  # 2. instead a more stable way would be to use the .fetch method
  def initialize(args)
    @chainring = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end

  # 3. You could also speficy defaults by mergning a defaults hash
  # def initialize(args)
  #   args = defaults.merge(args)
  #   @chainring = args.fetch(:chainring, 40)
  #   @cog = args.fetch(:cog, 18)
  #   @wheel = args[:wheel]
  # end

  # 3. This is esepcially useful if you have defaults that are complicated.
  # def defaults
  #   {:chainring => 40, :cog => 18}
  # end

  def gear_inches
    # 1. less dependent
    ratio * wheel.diameter
  end

  def ratio
    chainring/cog.to_f
  end

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

puts Gear.new(:chaingring => 52, :cog => 11, :wheel => Wheel.new(26, 1.5)).gear_inches
