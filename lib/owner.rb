class Owner
  attr_reader  :species 
  attr_accessor :name , :pets
  @@all=[]
  @@count = 0
  
    def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats=> []}
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@all.clear
    @@count = 0

  end
  
  
  
  def say_species
   "I am a #{@species}."
  end
  
  def buy_fish (name)
    fish=Fish.new(name)
    self.pets[:fishes] << fish
    
  end
  
    def buy_dog (name)
    
    self.pets[:dogs] << Dog.new(name)
    
    end
  
    def buy_cat (name)
    
    self.pets[:cats] << Cat.new(name)
    
     end
     
     def walk_dogs
       self.pets[:dogs] = self.pets[:dogs].map{ |dog| dog.mood="happy"  }
     end
     
      def play_with_cats
       self.pets[:cats] = self.pets[:cats].map{ |cat| cat.mood="happy"  }
     end
     
      def feed_fish
       self.pets[:fishes] = self.pets[:fishes].map{ |fish| fish.mood="happy"  }
     end
     
     def sell_pets
       @pets.each do  |k,v|
          
        v=v.map{ |p| p.mood="nervous" }   
        @pets[k] = [] 
      end
       
     end
     
     
     def list_pets
        count_list= @pets.map do  |k,v|
         
        @pets[k].count
      end
       
       "I have #{count_list[0]} fish, #{count_list[1]} dog(s), and #{count_list[2]} cat(s)."
       
     end
     
  
  
end