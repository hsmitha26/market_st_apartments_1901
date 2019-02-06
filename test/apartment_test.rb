require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test

  def setup
    @jessie = Renter.new("Jessie")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_it_exists
    assert_instance_of Apartment, @a1
  end

  def test_it_has_attributes
    assert_equal "A1", @a1.number
    assert_equal 1200, @a1.monthly_rent
    assert_equal 1, @a1.bathrooms
    assert_equal 1, @a1.bedrooms
  end

  def test_apartment_starts_with_no_renter
    assert_equal nil, @a1.renter
  end

  def test_can_add_renter
    @a1.add_renter(@jessie)
    assert_equal @jessie, @a1.renter
  end

end
