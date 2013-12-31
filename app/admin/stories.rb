ActiveAdmin.register Story do
  index do
    column :story do |story|
      story.name
    end
    column :cover_image do |story|
      image_tag( story.cover_image.url(:thumb) )
    end
    column :people do |story|
      story.people.alphabetically.map do |person|
        link_to person.name, edit_admin_person_path(person.id)
      end.join(" ").html_safe
    end
    column :pages do |story|
      story.pages.count
    end
    default_actions
  end

  form do |f|
    f.inputs "Story" do
      f.input :name
      f.input :cover_image
      f.input :people, as: :select, collection: Person.alphabetically
    end

    f.buttons
  end

  show do |story|
    attributes_table do
      row :id
      row :created_at
      row :cover_image_file_name
      row :cover_image_content_type
      row :cover_image_file_size
      row :cover_image_updated_at
      row :cover_image do
        image_tag story.cover_image.url(:thumb)
      end
      row :people do
        story.people.alphabetically.map do |p|
          link_to p.name, admin_page_path(p)
        end.join(" ").html_safe
      end
      row :pages do
        story.pages.map do |p|
          link_to admin_page_path(p) do
            image_tag p.image.url(:thumb)
          end
        end.join(" ").html_safe
      end
    end
    active_admin_comments
  end

  # Add New Story button to show page, for quick editing
  action_item only: [:show] do
    link_to "New Story", new_admin_story_path
  end

end
