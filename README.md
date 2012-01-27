#HasManyPolymorphic

This mixin adds a has many polymorphic relationship to a model and creates all the relationships needed by rails to handle it.
 

##Setup

You must define the models that you want to use inside an initializer using

    RussellEdge::HasManyPolymorphic::Engine.add_models(%w(PreferenceType))

or

	RussellEdge::HasManyPolymorphic::Engine.add_models("PreferenceType")
		
##Params
- Name 
	- name of the relationship, there is a convention that whatever name you choose, the polymorphic table columns on your through table should match.
        
- Options
	- through - the model that handles the through relationship
	- models  - models that should be included in this polymophic relationship
        
        
##Added methods
        
  - {name param}
	- the name of your relationship is used for the method name of this method. it will return an array of the models that are related via the has_many relationships
        
There is an after_save call back that will save the relationships when they are added or removed. If you want to remove a relationship the models need to be destroyed and this model reloaded.
        
##Example Usage
	
###Schema


	create_table :zoos, :force => true do |t|
      t.string :name
    end
  
    create_table :monkeys, :force => true do |t|
      t.string :name
    end
  
    create_table :bears, :force => true do |t|
      t.string :name
    end
  
    create_table :birds, :force => true do |t|
      t.string :name
    end
  
    create_table :zoo_animals, :force => true do |t|
      t.integer :zoo_id
	  t.references :animal, :polymorphic => true
    end
	
	
###Class
	
	
    class Zoo < ActiveRecord::Base
	  has_many_polymorphic :animals,
	    :through => :zoo_animals,
		:models => [:monkeys, :birds, :bears]
	end
		  
		  
###What you get
		
    zoo = Zoo.first
    zoo.monkeys
    zoo.birds
	zoo.bears
		   
and
		   
    zoo = Zoo.first
	zoo.animals
		   
which is a concatentated array of the models. You also get the following
		   
    monkey = Monkey.first
    monkey.zoos
		   
    bird = Bird.first
    bird.zoos
	
	bear = Bear.first
    bear.zoos