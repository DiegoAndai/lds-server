ActiveAdmin.register Entry do
  permit_params :concept, :video

  index do
    selectable_column
    id_column
    column :concept
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :concept
      row :video do |video_file|
        video_file.video.present? && link_to(
          video_file.video.metadata['filename'],
          video_file.video.download_url
        )
      end
      row :created_at
      row :updated_at
    end
  end

  filter :concept
  filter :created_at

  form do |f|
    f.inputs do
      f.input :concept
      f.input :video, as: :file
    end
    f.actions
  end
end
