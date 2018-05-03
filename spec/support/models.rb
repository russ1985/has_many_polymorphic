class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Monkey < ApplicationRecord
end

class Bird < ApplicationRecord
end

class Bear < ApplicationRecord
end

class ZooAnimal < ApplicationRecord
  belongs_to :zoo, optional: true
  belongs_to :animal, :polymorphic => true, optional: true
end

class Zoo < ApplicationRecord
  has_many_polymorphic :animals,
    :through => :zoo_animals,
    :models => [:monkeys, :birds, :bears]
end
