# checkout_spec.rb
require_relative '../checkout.rb'

describe Checkout, "#Basket 1" do
  it "The result should be 66.78." do
    promotional_rules = {"rule1" => {:cond => "total >= 60", :result => "total = total - (total*10/100)"}}
    co = Checkout.new(promotional_rules)
    co.scan(001)
    co.scan(002)
    co.scan(003)
    co.total.should eq(66.78)
  end
end