class Location < ActiveRecord::Base
  attr_accessible :city, :country, :state
  
  #Associations
  has_many :venues
  has_many :companies
  has_many :events, through: :venues
  
  #Validation
  validates :city, uniqueness: true
  
  #Cache
  after_save    :expire_location_all_cache
  after_destroy :expire_location_all_cache

  def expire_location_all_cache
    Rails.cache.delete('Location.all')
  end
  
  def self.all_cached
    Rails.cache.fetch('Location.all') { all }
  end
  
  #Class Method
  def self.find_by_name(title)
    self.where(city: title.split(',')).first
  end
  
  #Instance Method
  def name
    state ? "#{city}, #{state}" : "#{city}, #{country}"
  end
  
end
