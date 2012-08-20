class Event < ActiveRecord::Base
  attr_accessible :perma_name, :description, :event_end_date, :event_start_date, :name, :organizer, :price, :reg_end_date, :reg_start_date, :reg_url, :url, :venue_id
  
  #Associations
  belongs_to :venue
  
  has_many :sectors, through: :tags
  has_many :tags, as: :taggable
  
  has_many :people, through: :attendances, source_type: 'Person', source: :attending
  has_many :attendances

  has_many :companies, through: :attendances, source: :attending, source_type: 'Company'
  
  #Search
  include PgSearch
  multisearchable :against => [:name]
  
  #Scope
  scope :with_a_name, where('name <> ?', "")
  
end