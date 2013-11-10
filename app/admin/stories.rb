ActiveAdmin.register Story do
  form do |f|
    f.inputs "Story" do
      f.input :name
      f.input :people
    end

    f.buttons
  end

  show do |story|
    attributes_table do
      row :id
      row :created_at
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
