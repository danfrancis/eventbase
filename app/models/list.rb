class List < ActiveRecord::Base
  attr_accessible :list_type, :name
  
  #Associations
  has_many :trackers
  
  #Scopes
  scope :by_type, lambda { |type| where("list_type = ?", type)}
  
end
