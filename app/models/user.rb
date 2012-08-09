class User < ActiveRecord::Base
  attr_accessible :admin, :email, :last_login, :sign_in_times
  
  #Associations
  has_many :events, through: :tracker, source: :tracking, source_type: 'Event'
  has_many :persons, through: :tracker, source: :tracking, source_type: 'Person'
  has_many :companies, through: :tracker, source: :tracking, source_type: 'Company'
  
  
end
