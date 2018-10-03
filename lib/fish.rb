class Fish
  attr_accessor :mood
  attr_reader :name
  
  def initialize(name)
    self.name = name
    self.mood = "nervous"
  end
  
  private
  def name=(name)
    @name = name
  end
end