# checkout.rb
class Checkout

  attr_reader :promotional_rules, :articles, :items

  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules                                   # Initializes the promotional rules that may be applied
    @articles = {"AM" => {:name => "Agua mineral", :price => 3.11},           # for the checkout
                 "AC" => {:name => "Aceite", :price => 5.00},  
                 "CA" => {:name => "Café", :price => 11.23}}            # Initializes the articles in the shop
    @items = []
  end

  def scan(item)
    @items << item                                                          # Adds the key of every item to an array of keys
  end                                                                       # of scanned items

  def total()
    total = 0
    if(promotional_rules.size != 0)                                         # Checks if any of the rules is applicable before
      promotional_rules.each do |key, rule|                                 # processing the total
        if(eval(rule[:cond]))
          eval(rule[:result])
        end
      end
    end
    @items.each do |item|                                                   # Calculates the total from the scanned items
      article = @articles.values_at(item).first
      total = article[:price] + total
    end
    if(promotional_rules.size != 0)                                         # Checks if any of the rules is applicable after
      promotional_rules.each do |key, rule|                                 # processing the total
        if(eval(rule[:cond]))
          eval(rule[:result])
        end
      end
    end
    total.round(2)
  end
end