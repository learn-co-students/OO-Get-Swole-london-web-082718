class Gym

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select { |m| m.gym == self }
  end

  def lifters
    memberships.map(&:lifter)
  end

  def lifter_names
    lifters.map(&:name)
  end

  def lift_total_for_gym
    lifters.map(&:lift_total).inject(:+)
  end

end
