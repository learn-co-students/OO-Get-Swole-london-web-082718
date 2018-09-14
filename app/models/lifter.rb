
class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_lift
    self.all.map(&:lift_total).inject(:+) / self.all.count
  end

  def memberships
    Membership.all.select {|m| m.lifter == self}
  end

  def gyms
    memberships.map(&:gym)
  end

  def total_cost
    memberships.map(&:cost).inject(:+)
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

end
