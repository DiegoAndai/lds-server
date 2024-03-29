require 'shrine'

if Rails.env.development?
  require 'shrine/storage/s3'

  s3_options = {
    bucket: ENV.fetch('S3_BUCKET'),
    region: ENV.fetch('AWS_REGION'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(**s3_options)
  }
elsif Rails.env.production?
  require 'shrine/storage/s3'

  s3_options = {
    bucket: ENV.fetch('S3_BUCKET'),
    region: ENV.fetch('AWS_REGION'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(**s3_options)
  }
else
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :determine_mime_type, analyzer: :marcel
Shrine.plugin :download_endpoint, prefix: "attachments", redirect: true
Shrine.plugin :presign_endpoint, presign_options: ->(request) {
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition: ContentDisposition.inline(filename),
    content_type: type,
    content_length_range: 0..(5 * 1024 * 1024 * 1024)
  }
}
