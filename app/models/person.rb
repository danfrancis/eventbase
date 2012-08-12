class Person < ActiveRecord::Base
  attr_accessible :company_id, :name, :title
  
  #Associations
  belongs_to :company
  has_many :events, through: :attendance, source: :attending, source_type: 'Person'
  
  #Search
  include PgSearch
  multisearchable :against => [:name]
  
end
