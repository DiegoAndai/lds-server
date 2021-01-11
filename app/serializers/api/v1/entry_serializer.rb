class Api::V1::EntrySerializer < ActiveModel::Serializer
  type :entry

  attributes(
    :concept,
    :video_data,
    :video_url,
    :created_at,
    :updated_at
  )

  def video_url
    object.video&.url
  end
end
