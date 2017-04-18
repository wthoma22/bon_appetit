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

    assert_equal ["Cheese" => 20, "Flour" => 20], [pantry.shopping_list]
  end

  def test_pantry_can_add_mulitiple_items_to__new_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")

    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)

    pantry.add_to_shopping_list(r)

    assert_equal ["Noodles" => 10, "Sauce" => 10, "Cheese" => 5], [pantry.shopping_list]
    end

    def test_pantry_prints_list
      pantry = Pantry.new
      r = Recipe.new("Spaghetti")

      r.add_ingredient("Cheese", 20)
      r.add_ingredient("Flour", 20)
      r.add_ingredient("Spaghetti Noodles", 10)
      r.add_ingredient("Marinara Sauce", 10)

      pantry.add_to_shopping_list(r)

      assert_equal "* Cheese: 20\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10", pantry.print_shopping_list(r)
    end

end
