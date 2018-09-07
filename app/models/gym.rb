class Gym
  attr_reader :name

  @@all  = []

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym_type == self
    end
  end

  def lifters
    self.memberships.map do |lifter|
      lifter.member_name
    end
  end

  def lifter_names
    self.memberships.map do |lifter|
      lifter.member_name.name
    end
  end

  def lift_total_for_gym
    lift_sum = 0
    self.memberships.map do |lifter|
      lift_sum += lifter.member_name.lift_total
    end
  return lift_sum
  end
end
