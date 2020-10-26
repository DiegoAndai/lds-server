class Entry < ApplicationRecord
  include VideoUploader::Attachment(:video)

  validates :concept, presence: true
end

# == Schema Information
#
# Table name: entries
#
#  id         :bigint(8)        not null, primary key
#  concept    :string           not null
#  video_data :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
