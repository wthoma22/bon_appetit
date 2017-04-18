require './lib/recipe'

class Pantry

  attr_reader :stock, :shopping_list, :cookbook

  def initialize
    @stock = {}
    @shopping_list = {}
    @cookbook = {}
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

  def print_shopping_list(recipe)
    recipe.ingredients.each do |ingredient|
      p "* #{ingredient}\n"
    end
  end

  def add_to_cookbook(recipe)
    @cookbook = recipe
  end

  def what_can_i_make?
    if pantry.cookbook.keys < recipe.amount_required
      pantry.cookbook.keys
    else 
    end
  end

end
