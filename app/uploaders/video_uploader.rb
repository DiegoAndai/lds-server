class VideoUploader < BaseUploader
  Attacher.validate do
    validate_mime_type BaseUploader.allowed_types('video')
  end
end
