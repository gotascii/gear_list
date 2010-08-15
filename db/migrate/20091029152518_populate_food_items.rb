class PopulateFoodItems < ActiveRecord::Migration
  def self.foods
    ["oatmeal",
    "cream of wheat",
    "coffee",
    "gel",
    "bars",
    "bouillon",
    "potatoes",
    "butter",
    "ramen",
    "peanut butter",
    "chicken",
    "salmon",
    "olive oil",
    "honey roasted almonds",
    "chocolate almonds",
    "roasted almonds",
    "honey roasted peanuts",
    "roasted peanuts",
    "cashews",
    "dried berries",
    "raisins",
    "granola",
    "honey",
    "salt",
    "pepper",
    "basil",
    "cumin",
    "cilantro",
    "thyme"]
  end

  def self.up
    food = Function.find_by_name("Food")
    foods.uniq.each do |name|
      Item.create!(:function => food, :name => name.titleize, :weight => 0)
    end
  end

  def self.down
    foods.uniq.each do |name|
      Item.find_by_name(name.titleize).destroy
    end
  end
end
