class Filter < ActiveRecord::Base
  attr_accessible :filterable_id, :filterable_type, :title, :user_id
  
  #Associations
  belongs_to :filterable, polymorphic: true
  belongs_to :user
  
  #Scopes
  scope :for_lists, where(filterable_type: 'List')
  scope :for_events, where(filterable_type: 'Event')
  scope :for_sectors, where(filterable_type: 'Sector')
  scope :for_locations, where(filterable_type: 'Location')
  scope :by_user_and_type, lambda { |user_id, type| where('user_id = ? AND filterable_type = ?', user_id, type) }
  
  #Callback
  before_create :get_filterable_id
  
  def get_filterable_id
    filterable = self.filterable_type.constantize.find_or_create_by_name(self.title)
    self.filterable_id = filterable.id
  end

end