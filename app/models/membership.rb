class Membership

  attr_accessor :member_name, :gym_type, :cost

  @@all = []

  def initialize(member_name, gym_type, cost)
    @member_name = member_name
    @gym_type = gym_type
    @cost = cost

    @@all << self
  end


  def self.all
    @@all
  end


end
