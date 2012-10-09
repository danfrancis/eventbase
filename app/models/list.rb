class List < ActiveRecord::Base
  attr_accessible :list_type, :name, :user_id
  
  #Associations
  has_many :trackers
  belongs_to :users
  has_many :filters, as: :filterable
  has_many :events, through: :trackers, source_type: 'Event', source: :tracking
  
  #Scopes
  scope :by_type, lambda { |type| where("list_type = ?", type)}
  
end
