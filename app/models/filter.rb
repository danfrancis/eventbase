class Filter < ActiveRecord::Base
  attr_accessible :filterable_id, :filterable_type, :title, :user_id
end
