require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_pantry_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_pantry_can_stock
    pantry = Pantry.new
    assert pantry.stock
  end

  def test_pantry_can_stock_check
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_pantry_can_restock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
    pantry.restock("Cheese", 10)
    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_pantry_can_stock_other_universal_units
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
    pantry.restock("Cheese", 30)
    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_pantry_can_add_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    pantry.add_to_shopping_list(r)

    assert_equal [Cheese: 20, Flour: 20], pantry.shopping_list
  end

end
