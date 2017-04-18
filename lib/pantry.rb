require './lib/recipe'

class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
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

  def add_to_shopping_list(recipe)
    @shopping_list = recipe.ingredients
  end

end
