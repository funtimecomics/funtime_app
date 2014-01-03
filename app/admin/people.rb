ActiveAdmin.register Person do
  index do
    selectable_column
    column :person do |person|
      "<h3>#{person.name}</h3> #{person.slug}".html_safe
    end
    column :image do |person|
      image_tag( person.image.url(:thumb) ) + person.image_file_name
    end
    column :stories do |person|
      content_tag :ul do
        content_tag_for :li, person.stories.alphabetically do |story|
          link_to story.name, edit_admin_story_path(story.id)
        end
      end
    end
    default_actions
  end

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
      # row :id
      # row :created_at
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
