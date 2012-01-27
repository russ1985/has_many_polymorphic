class Monkey < ActiveRecord::Base
end

class Bird < ActiveRecord::Base
end

class Bear < ActiveRecord::Base
end

class ZooAnimal < ActiveRecord::Base
	belongs_to :zoo
	belongs_to :animal, :polymorphic => true
end

class Zoo < ActiveRecord::Base
	has_many_polymorphic :animals,
		:through => :zoo_animals,
		:models => [:monkeys, :birds, :bears]
end

