class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :country, :lat, :long, :name, :state, :zip_code, :location_id
  
  #Associations
  has_many :events
  belongs_to :location
  
  #Search
  # include PgSearch
  # multisearchable :against => [:name]
  
  # Geocoding
  # geocoded_by :full_street_address, :latitude  => :lat, :longitude => :long # ActiveRecord
  # after_validation :geocode
  
  def full_street_address
    "#{self.address} #{self.city} #{self.country} #{self.zip_code}"
  end
  
  #GMaps
  acts_as_gmappable :lat => "lat", :lng => "long"

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address} #{self.city} #{self.country} #{self.zip_code}"
  end
  
  def gmaps
    true
  end
  
  def self.locations
    self.all.map { |v| "#{v.city}"}.uniq
  end
  
  def location_print
    state ? "#{city}, #{state}" : "#{city}, #{country}"
  end
  
end
