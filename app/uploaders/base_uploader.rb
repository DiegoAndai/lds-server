class BaseUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type allowed_types
  end

  def self.allowed_types(type)
    file = JSON.parse(File.read(Rails.root.join('app/assets/json/file_types.json')))
    file[type]
  end
end
