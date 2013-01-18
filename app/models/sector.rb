class Sector < ActiveRecord::Base
  attr_accessible :name
  
  #Associations
  has_many :tags
  has_many :events, through: :tags, source_type: 'Event', source: :taggable
  has_many :companies, through: :tags, source_type: 'Company', source: :taggable
  
  #Cache
  after_save    :expire_sector_all_cache
  after_destroy :expire_sector_all_cache

  def expire_sector_all_cache
    Rails.cache.delete('Sector.all')
  end
  
  def self.all_cached
    Rails.cache.fetch('Sector.all') { all }
  end
  
end
