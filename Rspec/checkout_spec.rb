# checkout_spec.rb
require_relative '../checkout.rb'

describe Checkout, "#Basket 1" do
  it "The result should be 22.45." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("GR1")/2) >= 1', :result => '(@items.count("GR1")/2).times do @items.delete_at(@items.index("GR1")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("SR1") >= 3', :result => '@articles["SR1"] = {:name => "Strawberries", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("GR1")
    co.scan("SR1")
    co.scan("GR1")
    co.scan("GR1")
    co.scan("CF1")
    expect(co.total).to eq(22.45)
  end
end

describe Checkout, "#Basket 2" do
  it "The result should be 3.11." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("GR1")/2) >= 1', :result => '(@items.count("GR1")/2).times do @items.delete_at(@items.index("GR1")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("SR1") >= 3', :result => '@articles["SR1"] = {:name => "Strawberries", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("GR1")
    co.scan("GR1")
    expect(co.total).to eq(3.11)
  end
end

describe Checkout, "#Basket 3" do
  it "The result should be 16.61." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("GR1")/2) >= 1', :result => '(@items.count("GR1")/2).times do @items.delete_at(@items.index("GR1")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("SR1") >= 3', :result => '@articles["SR1"] = {:name => "Strawberries", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("SR1")
    co.scan("SR1")
    co.scan("GR1")
    co.scan("SR1")
    expect(co.total).to eq(16.61)
  end
end