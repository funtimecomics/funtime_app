ActiveAdmin.register Story do
  index do
    selectable_column
    column :story do |story|
      content_tag :h3, story.name
    end
    column :cover_image do |story|
      image_tag( story.cover_image.url(:thumb) )
    end
    column :people do |story|
      content_tag :ul do
        content_tag_for :li, story.people.alphabetical do |person|
          link_to person.name, edit_admin_person_path(person.id)
        end
      end
    end
    column :pages do |story|
      story.pages.ordered.count
    end
    default_actions
  end

  form do |f|
    f.inputs "Story" do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :cover_image, :image_preview => true, hint: "Cover image should be square, and will be resized to 300 by 300 pixels"
      f.input :people, as: :select, collection: Person.alphabetical
      f.input :description, as: :html_editor
      f.has_many :pages, for: [:pages, f.object.pages.ordered], :allow_destroy => true, :heading => 'Pages', :new_record => true, hint: "foo" do |pf|
        pf.input :position
        pf.input :image, :image_preview => true, hint: "Page images will be resized to a width of 945 pixels"
      end
    end

    f.buttons
  end

  show do |story|
    attributes_table do
      row :cover_image_file_name
      row :cover_image_content_type
      row :cover_image_file_size
      row :cover_image_updated_at
      row :cover_image do
        image_tag story.cover_image.url(:thumb)
      end
      row :people do
        story.people.alphabetical.map do |p|
          link_to p.name, admin_page_path(p)
        end.join(" ").html_safe
      end
      row :pages do
        story.pages.ordered.map do |p|
          link_to admin_page_path(p) do
            image_tag p.image.url(:thumb)
          end
        end.join(" ").html_safe
      end
    end
    # active_admin_comments
  end

  # Add New Story button to show page, for quick editing
  action_item only: [:show] do
    link_to "New Story", new_admin_story_path
  end

  # Return to index after create, update
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_stories_url }
      end
    end
    def update
      update! do |format|
        format.html { redirect_to admin_stories_url }
      end
    end
  end
end
