require 'dragonfly'
app = Dragonfly[:images]

app.datastore = Dragonfly::DataStorage::S3DataStore.new


app.datastore.configure do |c|
  c.bucket_name = "URL" if Rails.env.production?
  c.bucket_name = 'development' if Rails.env.development?
  c.access_key_id = APP_CONFIG[:access_key_id]
  c.secret_access_key = APP_CONFIG[:secret_access_key]
end

app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_accessor)
