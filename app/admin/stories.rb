ActiveAdmin.register Story do
  form do |f|
    f.inputs "Story" do
      f.input :name
    end

    f.has_many :pages do |p|
      p.input :image
    end
    f.buttons
  end

  show do |story|
    attributes_table do
      row :id
      row :created_at
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
