class Company < ActiveRecord::Base
  attr_accessible :name, :url, :description
  
  #Associations
  has_many :people
  has_many :events, through: :attendances
  has_many :sectors, through: :tags, source: :taggable, source_type: 'Company'
  has_many :attendances, as: :attending
  
  #Search
  include PgSearch
  multisearchable :against => [:name]  
  
  #Pagination
  paginates_per 25
  
end
