class Owner

  @@all = []

  attr_reader :species

  attr_accessor :mood, :name, :pets

  def initialize(species)
    @species = species
    self.class.all << self
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end 

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each {|d| d.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|c| c.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|f| f.mood = "happy"}
  end

  def sell_pets
    self.pets.each_value{|petA| petA.each {|pet| pet.mood = "nervous"}}
    self.pets.each_key{|key| self.pets[key].clear}
  end

  def list_pets
    fishcount = self.pets[:fishes].count
    dogcount = self.pets[:dogs].count
    catcount = self.pets[:cats].count

    "I have #{fishcount} fish, #{dogcount} dog(s), and #{catcount} cat(s)."
    
  end
end