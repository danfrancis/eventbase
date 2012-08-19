class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :country, :lat, :long, :name, :state, :zip_code
  
  #Associations
  has_many :events
  
  #Search
  include PgSearch
  multisearchable :against => [:name]
  
  # Geocoding
  geocoded_by :full_street_address, :latitude  => :lat, :longitude => :long # ActiveRecord
  after_validation :geocode
  
  def full_street_address
    "#{self.address} #{self.city} #{self.country} #{self.zip_code}"
  end
  
end
