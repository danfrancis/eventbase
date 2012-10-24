AdminData.config do |config|
  config.is_allowed_to_view = lambda {|controller| if Rails.env.development? || Rails.env.production? }
  config.is_allowed_to_update = lambda {|controller| if Rails.env.development? || Rails.env.production? }
end