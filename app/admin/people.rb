ActiveAdmin.register Person do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Person", :multipart => true do
      f.input :name
      f.input :image
      f.input :bio, as: :text
    end
    f.buttons
  end

  show do |person|
    attributes_table do
      row :id
      row :created_at
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :image_updated_at
      row :image do
        image_tag person.image.url(:thumb)
      end
    end
    active_admin_comments
  end

  # Add New Person button to show page, for quick editing
  action_item only: [:show] do
    link_to "New Person", new_admin_person_path
  end
end
