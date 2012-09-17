class User < ActiveRecord::Base
  attr_accessible :email, :last_login, :sign_in_times, :first_name, :last_name, :password, :password_confirmation
  
  #Associations
  has_many :events, through: :tracker, source: :tracking, source_type: 'Event'
  has_many :persons, through: :tracker, source: :tracking, source_type: 'Person'
  has_many :companies, through: :tracker, source: :tracking, source_type: 'Company'
  has_many :trackers
  
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
  
  def events_tracking
    self.trackers.map { |t| t if t.tracking_type == 'Event'}
  end
  
  def companies_tracking
    
  end

end
