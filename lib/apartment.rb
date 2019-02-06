class Apartment

  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms

  attr_accessor :renter

  def initialize(individual_apt)
    @number = individual_apt[:number]
    @monthly_rent = individual_apt[:monthly_rent]
    @bathrooms = individual_apt[:bathrooms]
    @bedrooms = individual_apt[:bedrooms]
  end

  def add_renter(renter_name)
    @renter = renter_name
  end

end
