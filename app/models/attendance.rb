class Attendance < ActiveRecord::Base
  attr_accessible :attending_id, :attending_type, :event_id, :role
  
  #Associations
  belongs_to :attending, polymorphic: true
  belongs_to :event
  
end
