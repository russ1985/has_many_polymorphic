ActiveRecord::Schema.define(:version => 0) do
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
end
