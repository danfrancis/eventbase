class Company < ActiveRecord::Base
  attr_accessible :name, :url, :description
  
  #Associations
  has_many :people
  has_many :events, through: :attendance, source: :attending, source_type: 'Company'
  has_many :sectors, through: :tags, source: :taggable, source_type: 'Company'
  
  #Search
  include PgSearch
  multisearchable :against => [:name]  
  
end
