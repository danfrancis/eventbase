class Sector < ActiveRecord::Base
  attr_accessible :name
  
  #Associations
  has_many :tags
  
end
