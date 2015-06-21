# checkout_spec.rb
require_relative '../checkout.rb'

describe Checkout, "#Basket 1" do
  it "The result should be 22.45." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("AM")/2) >= 1', :result => '(@items.count("AM")/2).times do @items.delete_at(@items.index("AM")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("AC") >= 3', :result => '@articles["AC"] = {:name => "Strawberries", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("AM")
    co.scan("AC")
    co.scan("AM")
    co.scan("AM")
    co.scan("CA")
    expect(co.total).to eq(22.45)
  end
end

describe Checkout, "#Basket 2" do
  it "The result should be 3.11." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("AM")/2) >= 1', :result => '(@items.count("AM")/2).times do @items.delete_at(@items.index("AM")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("AC") >= 3', :result => '@articles["AC"] = {:name => "Aceite", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("AM")
    co.scan("AM")
    expect(co.total).to eq(3.11)
  end
end

describe Checkout, "#Basket 3" do
  it "The result should be 16.61." do
                      # As long as the second green tea is free it is removed from the shopping basket in order to calculate the total
    pricing_rules = {"rule1" => {:cond => '(@items.count("AM")/2) >= 1', :result => '(@items.count("AM")/2).times do @items.delete_at(@items.index("AM")) end'},
                     # If there are 3 or more strawberries the price for them changes
                     "rule2" => {:cond => '@items.count("AC") >= 3', :result => '@articles["AC"] = {:name => "Aceite", :price => 4.50}'}}
    co = Checkout.new(pricing_rules)
    co.scan("AC")
    co.scan("AC")
    co.scan("AM")
    co.scan("AC")
    expect(co.total).to eq(16.61)
  end
end