require "pry"
class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []
  
  def initialize(species)
    @species = species 
    self.pets = {fishes: [], cats: [], dogs: []}
    self.save
  end 
  
  def say_species 
    "I am a #{self.species}."
  end 
  
  def buy_fish(name)
    Fish.new(name).tap{|fish| self.pets[:fishes] << fish}
  end 
  
  def buy_cat(name)
    Cat.new(name).tap{|cat| self.pets[:cats] << cat}
  end 
  
  def buy_dog(name)
    Dog.new(name).tap{|dog| self.pets[:dogs] << dog}
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
    self.pets.each do |pets, pet_arr|
      pet_arr.each do |pet|
       # binding.pry
        pet.mood = "nervous"
      end
      pet_arr.clear
    end 
    
  def list_pets
    num_fish = self.pets[:fishes].count 
    num_dogs = self.pets[:dogs].count
    num_cats = self.pets[:cats].count
    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
    
  end 
      
  end 
  
  def self.count 
    @@all.count 
  end 
  
  def self.reset_all
    @@all.clear 
  end 

  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self
  end 
  

end