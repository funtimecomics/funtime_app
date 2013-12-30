ActiveAdmin.register Story do
  index do
    column :story do |story|
      story.name
    end
    column :cover_image do |story|
      image_tag( story.cover_image.url(:thumb) ) + story.cover_image_file_name
    end
    column :people do |story|
      story.people.map do |person|
        image_tag( person.image.url(:thumb) ) + person.name
      end.join(" ").html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs "Story" do
      f.input :name
      f.input :cover_image
      f.input :people
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
        story.people.map do |p|
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
end
