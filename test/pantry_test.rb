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
    assert_equal pantry.restock("Cheese", 20)
  end

  def test_pantry_can_stock_check_after_restock
    skip
    pantry.restock("Cheese", 20)
    pantry.stock_check("Cheese")

    assert_equal 30, pantry.stock_check
  end

end
