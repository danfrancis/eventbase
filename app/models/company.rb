class Company < ActiveRecord::Base
  attr_accessible :name, :url, :description, :company_perma, :zipcode, :country, :fb_perma, :tw_perma
  
  #Associations
  has_many :people
  has_many :events, through: :attendances
  has_many :sectors, through: :tags
  has_many :tags, as: :taggable
  has_many :attendances, as: :attending
  
  #Search
  # include PgSearch
  # multisearchable :against => [:name]  
  
  #Pagination
  # paginates_per 25
  
  #Cache
  after_save    :expire_company_all_cache
  after_destroy :expire_company_all_cache

  def expire_company_all_cache
    Rails.cache.delete('Company.all')
  end
  
  def self.all_cached
    Rails.cache.fetch('Company.all') { all }
  end
  
  #Instance Methods
  def sector_names
    return self.sectors.map { |sector| sector.name }
  end
  
end
