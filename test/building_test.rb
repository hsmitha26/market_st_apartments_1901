require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @spencer = Renter.new("Spencer")
    @jessie = Renter.new("Jessie")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_starts_with_no_apartments
    assert_equal [], @building.units
  end

  def test_building_can_add_units
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal [@a1, @b2], @building.units
  end

  def test_calculate_average_rent_for_building
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    # binding.pry
    assert_equal @spencer, @building.renter_with_highest_rent

    @a1.add_renter(@jessie)
    assert_equal @jessie, @building.renter_with_highest_rent
  end
end
