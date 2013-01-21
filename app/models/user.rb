class User < ActiveRecord::Base
  attr_accessible :email, :last_login, :sign_in_times, :first_name, :last_name, :password, :password_confirmation
  
  #Associations
  has_many :events, through: :trackers, source: :tracking, source_type: 'Event'
  has_many :persons, through: :trackers, source: :tracking, source_type: 'Person'
  has_many :companies, through: :trackers, source: :tracking, source_type: 'Company'
  has_many :trackers
  has_many :lists
  has_many :filters
  
  #Secure sign-on
  has_secure_password
  
  #Validation
  validates_presence_of :password, on: :create

  #Instance method
  
  def update_last_login
    self.update_attribute(:last_login, Time.now)
  end
  
  def tracking?(tracking_item)
    tracking = Tracker.where("user_id = ? AND tracking_id = ? AND tracking_type = ?", self.id, tracking_item.id, tracking_item.class.name)
    return tracking.any?
  end
  
  def tracking_list(tracking_item)
    tracking = Tracker.where("user_id = ? AND tracking_id = ? AND tracking_type = ?", self.id, tracking_item.id, tracking_item.class.name)
    return tracking.first.list
  end
  
  def events_tracking
    self.events
  end
  
  def companies_tracking
    self.companies
  end
  
  def name
    
    "#{first_name ? first_name.slice(0) : nil}. #{last_name}"    
  end

end
