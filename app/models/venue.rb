class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :country, :lat, :long, :name, :state
  
  #Associations
  has_many :events
  
end
