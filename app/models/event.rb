class Event < ActiveRecord::Base
  attr_accessible :description, :event_end_date, :event_start_date, :name, :organizer, :price, :reg_end_date, :reg_start_date, :reg_url, :url, :venue_id
  
  #Associations
  belongs_to :venue
  has_many :companies, through: :attendance, source: :attending, source_type: 'Company'
  has_many :sectors, through: :tags, source: :taggable, source_type: 'Event'
  has_many :persons, through: :attendance, source: :attending, source_type: 'Person'
  
end
