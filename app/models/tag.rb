class Tag < ActiveRecord::Base
  attr_accessible :sector_id, :taggable_id, :taggable_type
  
  #Associations
  belongs_to :taggable, polymorphic: true
  belongs_to :sector
  
end
