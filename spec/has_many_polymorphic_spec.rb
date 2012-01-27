require 'spec_helper'

describe "HasManyPolymorphic" do
	before(:all) do
		Zoo.create(:name => 'Zoo Lander')
		Bear.create(:name => 'Smokey')
		Bird.create(:name => 'Big Bird')
		Monkey.create(:name => 'George')
	end
	
	it "should create the animals" do
		Monkey.find_by_name('George').name.should eq 'George'
		Bird.find_by_name('Big Bird').name.should eq 'Big Bird'
		Bear.find_by_name('Smokey').name.should eq 'Smokey'
	end
	
	it "should allow you to add animals to a zoo" do
		zoo = Zoo.first
		zoo.animals.count.should eq 0
		zoo.monkeys << Monkey.find_by_name('George')
		zoo.birds << Bird.find_by_name('Big Bird')
		zoo.bears << Bear.find_by_name('Smokey')
		zoo.save
		
		zoo.animals.count.should eq 3
	end
	
	it "should allow you to get the zoo from an animal" do
		zoo = Zoo.first
		
		zoo.monkeys << Monkey.find_by_name('George')
		zoo.birds << Bird.find_by_name('Big Bird')
		zoo.bears << Bear.find_by_name('Smokey')
		zoo.save
		
		monkey = Monkey.find_by_name('George')
		monkey.zoos.first.id.should eq zoo.id
		
		bird = Bird.find_by_name('Big Bird')
		bird.zoos.first.id.should eq zoo.id
		
		bear = Bear.find_by_name('Smokey')
		bear.zoos.first.id.should eq zoo.id
	end
end