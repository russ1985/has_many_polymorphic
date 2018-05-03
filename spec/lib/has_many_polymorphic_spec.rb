require 'spec_helper'

describe "HasManyPolymorphic" do
  before(:all) do
    Zoo.create(:name => 'Zoo Lander')
    Bear.create(:name => 'Smokey')
    Bird.create(:name => 'Big Bird')
    Monkey.create(:name => 'George')
  end

  it "has created the animals and zoo" do
    expect(Zoo.first.name).eql?'Zoo Lander'
    expect(Monkey.find_by_name('George').name).eql? 'George'
    expect(Bird.find_by_name('Big Bird').name).eql? 'Big Bird'
    expect(Bear.find_by_name('Smokey').name).eql? 'Smokey'
  end

  it "allows you to add animals to a zoo" do
    zoo = Zoo.first
    expect(zoo.animals.count).eql? 0
    zoo.monkeys << Monkey.find_by_name('George')
    zoo.birds << Bird.find_by_name('Big Bird')
    zoo.bears << Bear.find_by_name('Smokey')
    zoo.save

    expect(zoo.monkeys.count).eql? 1
    expect(zoo.monkeys.first.name).eql? 'George'

    expect(zoo.birds.count).eql? 1
    expect(zoo.birds.first.name).eql? 'Big Bird'

    expect(zoo.bears.count).eql? 1
    expect(zoo.bears.first.name).eql? 'Smokey'

    expect(zoo.animals.count).eql? 3
  end

  it "allows you to get the zoo from an animal" do
    zoo = Zoo.first

    zoo.monkeys << Monkey.find_by_name('George')
    zoo.birds << Bird.find_by_name('Big Bird')
    zoo.bears << Bear.find_by_name('Smokey')

    zoo.save!

    monkey = Monkey.find_by_name('George')
    expect(monkey.zoos.first.id).eql? zoo.id

    bird = Bird.find_by_name('Big Bird')
    expect(bird.zoos.first.id).eql? zoo.id

    bear = Bear.find_by_name('Smokey')
    expect(bear.zoos.first.id).eql? zoo.id
  end
end
