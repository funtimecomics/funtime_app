ActiveAdmin.register Page do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Page", :multipart => true do
      f.input :image
    end
    f.buttons
  end

  show do |page|
    attributes_table do
      row :id
      row :created_at
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :image_updated_at
      row :image do
        image_tag page.image.url(:thumb)
      end
    end
    active_admin_comments
  end
end
