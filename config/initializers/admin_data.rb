AdminData.config do |config|
  config.is_allowed_to_view = lambda { |controller| Rails.env.development? || Rails.env.production? }
  config.is_allowed_to_update = lambda { |controller| Rails.env.development? || Rails.env.production? }
end