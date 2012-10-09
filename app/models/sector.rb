class Sector < ActiveRecord::Base
  attr_accessible :name
  
  #Associations
  has_many :tags
  has_many :events, through: :tags, source_type: 'Event', source: :taggable
  
end
