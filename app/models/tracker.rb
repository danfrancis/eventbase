class Tracker < ActiveRecord::Base
  attr_accessible :email_frequency, :tracking_id, :tracking_type, :user_id, :list_id
  
  #Associations
  belongs_to :tracking, polymorphic: true
  belongs_to :user
  belongs_to :list
  
end
