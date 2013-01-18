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
  # include PgSearch
  # multisearchable :against => [:name]
  
  #Scope
  scope :with_a_name, where('name <> ?', "")
  
  #Cache
  after_save    :expire_event_all_cache
  after_destroy :expire_event_all_cache

  def expire_event_all_cache
    Rails.cache.delete('Event.all')
  end
  
  def self.all_cached
    Rails.cache.fetch('Event.all') { all }
  end
  
  #Instance Methods
  def city_and_state
    return "#{self.venue.city}, #{self.venue.state}"
  end
  
  def country
    return "#{self.venue.country}"
  end
  
  def sector_names
    return self.sectors.map { |sector| sector.name }
  end

  def company_names
    self.companies[0..5].map { |company| company.name }.join('</li><li>').html_safe
  end
  
  def start_year
    self.event_start_date.strftime('%Y')
  end
  
  def start_month
    self.event_start_date.strftime('%-m').to_i - 1
  end
  
  def start_day
    self.event_start_date.strftime('%e')
  end
  
  def end_year
    self.event_end_date.strftime('%Y')
  end
  
  def end_month
    self.event_end_date.strftime('%-m').to_i - 1
  end
  
  def end_day
    self.event_end_date.strftime('%e')
  end
  
end
