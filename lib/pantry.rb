require './lib/recipe'

class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient]
      @stock[ingredient]
    else
      @stock[ingredient] = 0
    end
  end

  def restock(ingredient, amount)
    if @stock[ingredient]
      @stock[ingredient] += amount
    else
      @stock[ingredient]
    end
  end

end
