require 'pry'
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  
  def initialize(name)
    self.pets = {fishes: [], dogs: [],cats: []}
    self.name = name
    self.species = "human"
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.reset_all
    @@all = []
  end
  
  def self.count
    @@all.length
  end
  
  def say_species
     "I am a #{self.species}."
  end
  
  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end
  
  def buy_cat(name)
     self.pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end
  
  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each {|type, pets| 
    pets.each {|pet| pet.mood = "nervous"}
    pets.clear
    }
  end
  
  def list_pets
    retString = "I have"
    counter = 0
    self.pets.each {|type, pets| 
      petType = ""
      case counter
      when 0
        petType = "fish"
      when 1 
        retString << ","
        petType = "dog(s)"
      when 2 
        retString << ", and"
        petType = "cat(s)"
      end
      counter += 1
      retString << " #{pets.length} #{petType}"
    }
    retString << "."
    retString
  end
  
  private
  def species=(species)
    @species = species
  end
end