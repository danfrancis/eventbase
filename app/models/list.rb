class List < ActiveRecord::Base
  attr_accessible :list_type, :name, :user_id
  
  #Associations
  has_many :trackers
  belongs_to :users
  has_many :filters, as: :filterable
  has_many :events, through: :trackers, source_type: 'Event', source: :tracking
  has_many :companies, through: :trackers, source_type: 'Company', source: :tracking
  
  #Scopes
  scope :by_type, lambda { |type| where("list_type = ?", type)}
  
  #Validation
  validate :unique_name_for_a_user
  
  def unique_name_for_a_user
    user = User.find(self.user_id.to_s, include: :lists)
    list_names = user.lists.map { |list| list.name.downcase }
    if list_names.index(self.name.downcase).present?
      errors.add(:name, "must be unique")
    end
  end
  
end
