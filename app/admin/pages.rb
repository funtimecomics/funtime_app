ActiveAdmin.register Page do
  index do
    column :page do |page|
      page.story.name + " " + page.position.to_s
    end
    column :image do |page|
      image_tag( page.image.url(:thumb) ) + page.image_file_name
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Page", :multipart => true do
      f.input :story
      f.input :position
      f.input :image
    end
    f.buttons
  end

  show do |page|
    attributes_table do
      row :id
      row :story do
        page.story.name if page.story
      end
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
