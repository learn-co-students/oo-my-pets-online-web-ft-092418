require 'pry'
class Owner
  @@all = []
  
  attr_accessor :name, :pets
  attr_reader :species
  
  def initialize(species)
    @species = species
    @@all << self
    @pets = {cats: [], dogs: [], fishes: []}
  end
  
  def self.all
    @@all
  end 
  
  def self.count
    @@all.count
  end 
  
  def self.reset_all
    @@all.clear
  end 
  
  def species
    @species
  end 
  
  def say_species
    "I am a #{@species}."
  end 
  
  def pets
    @pets
  end 
  
  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end 
  
  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end 
  
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end 
  
  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end 
  
  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end 
  
  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end 
  
  def sell_pets
    @pets.each do |pets, array|
      array.each {|p| p.mood = "nervous"}
      array.clear
    end 
  end 
  
  def list_pets
    "I have #{@pets[:fishes].count.to_s} fish, " + @pets[:dogs].count.to_s + " dog(s), and " + @pets[:cats].count.to_s + " cat(s)."
  end 
  
end