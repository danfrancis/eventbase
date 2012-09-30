class List < ActiveRecord::Base
  attr_accessible :list_type, :name, :user_id
  
  #Associations
  has_many :trackers
  belongs_to :users
  
  #Scopes
  scope :by_type, lambda { |type| where("list_type = ?", type)}
  
end
