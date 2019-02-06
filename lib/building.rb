class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apt_object_to_be_added)
    @units << apt_object_to_be_added
  end

  def average_rent
    number_of_units = @units.count
    total_rent = 0
    @units.each do |apt_object|
      total_rent += apt_object.monthly_rent
    end
    ((total_rent.to_f) / number_of_units).round(2)
  end

  def renter_with_highest_rent
    rent_array = []
    @units.each do |rent|
      rent_array << rent.monthly_rent
    end
    max_rent = rent_array.max
    @units.select do |apt_object|
      # binding.pry
      if apt_object.renter != nil
        apt_object.monthly_rent == max_rent
        apt_object.renter
      end
    end
    #the reason this test fails is because return is nil
    #when there isn't a renter added. Need to add condition
    #to address lack of renter in unit.
  end

end
