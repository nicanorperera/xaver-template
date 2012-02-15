require 'dragonfly'
app = Dragonfly[:images]

app.datastore = Dragonfly::DataStorage::S3DataStore.new


app.datastore.configure do |c|
  c.bucket_name = "URL" if Rails.env.production?
  c.bucket_name = 'development' if Rails.env.development?
  c.access_key_id = 'AKIAJLFRFWLLZBKPNOZA'
  c.secret_access_key = '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'
end

app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_accessor)
