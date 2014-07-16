# checkout_spec.rb
require_relative '../checkout.rb'

describe Checkout, "#Basket 1" do
  it "The result should be 66.78." do
    promotional_rules = {"rule1" => {:cond => "total >= 60", :result => "total = total - (total*10/100)"}}
    co = Checkout.new(promotional_rules)
    co.scan("001")
    co.scan("002")
    co.scan("003")
    co.total.should eq(66.78)
  end
end

describe Checkout, "#Basket 2" do
  it "The result should be 36.95." do
    promotional_rules = {"rule1" => {:cond => "total >= 60", :result => "total = total - (total*10/100)"},
                         "rule2" => {:cond => '@items.count("001") >= 2', :result => '@articles["001"] = {:name => "Lavender heart", :price => 8.50}'}}
    co = Checkout.new(promotional_rules)
    co.scan("001")
    co.scan("003")
    co.scan("001")
    co.total.should eq(36.95)
  end
end

describe Checkout, "#Basket 3" do
  it "The result should be 73.76." do
    promotional_rules = {"rule1" => {:cond => "total >= 60", :result => "total = total - (total*10/100)"},
                         "rule2" => {:cond => '@items.count("001") >= 2', :result => '@articles["001"] = {:name => "Lavender heart", :price => 8.50}'}}
    co = Checkout.new(promotional_rules)
    co.scan("001")
    co.scan("002")
    co.scan("001")
    co.scan("003")
    co.total.should eq(73.76)
  end
end