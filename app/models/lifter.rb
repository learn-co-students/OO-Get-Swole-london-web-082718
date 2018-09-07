class Lifter

  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.member_name == self
    end
  end

   def gyms
     self.memberships.map do |gym|
       gym.gym_type
     end
   end

   def self.average_lift
     total = 0
     Lifter.all.each do |lifter|
       total += lifter.lift_total
     end
     return total / Lifter.all.length
   end

   def sign_up(cost,gym_type)
     Membership.new(self, gym_type, cost)
   end

   def total_cost
     total = 0
     Membership.all.each do |membership|
       if membership.member_name == self
         total += membership.cost
       end
     end
     return total
   end
end
