class Api::V1::EntrySerializer < ActiveModel::Serializer
  type :entry

  attributes(
    :concept,
    :video_data,
    :created_at,
    :updated_at
  )
end
