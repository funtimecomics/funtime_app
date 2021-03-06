ActiveAdmin.register Story do
  permit_params :cover_image,
                :cover_image_file_name,
                :cover_image_content_type,
                :cover_image_file_size,
                :cover_image_updated_at,
                :name,
                { person_ids: [] },
                :description,
                :rating,
                :unfinished,
                :story_pages,
                pages_attributes: [:id, :story_page_number, :story_id]

  index do
    selectable_column
    column :story do |story|
      content_tag :h3, story.name
    end
    column :cover_image do |story|
      image_tag(story.cover_image.url(:thumb))
    end
    column :rating do |story|
      story.rating
    end
    column :people do |story|
      content_tag :ul do
        content_tag_for :li, story.people.alphabetical do |person|
          link_to person.name, edit_admin_person_path(person.id)
        end
      end
    end
    column :pages do |story|
      story.pages.count
    end
    actions
  end

  index as: :grid do |story|
    link_to admin_story_path(story) do
      image_tag(story.cover_image.url(:thumb)) + "<h4>#{story.name}</h4>".html_safe
    end
  end

  form html: {multipart: true} do |f|
    f.actions
    f.inputs t('admin.story.form_title'), class: 'inputs story' do
      f.semantic_errors(*f.object.errors.keys)
      f.input :name
      f.input :rating, as: :select, collection: Story.ratings.keys
      f.input :cover_image,
              image_preview: true,
              hint: t('admin.story.cover_image_hint')
      f.input :people, as: :select, collection: Person.alphabetical
      f.input :unfinished
      f.input :description, as: :html_editor
    end
    f.inputs t('admin.story_pages.form_title'), class: 'inputs story_pages' do
      f.has_many :pages,
                 for: [:pages, f.object.pages.ordered_for_story],
                 sortable: :story_page_number,
                 sortable_start: 1,
                 heading: false,
                 allow_destroy: false,
                 new_record: false do |pf|
        pf.input :story_page_number, as: :page_sorting, label: false
      end
    end
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
          link_to p.name, admin_person_path(p)
        end.join(' ').html_safe
      end
      row :pages do
        story.pages.ordered_for_story.map do |p|
          image_tag p.image.url(:thumb)
        end.join(' ').html_safe
      end
    end
    # active_admin_comments
  end

  # Add New Story button to show page, for quick editing
  action_item only: [:show] do
    link_to 'New Story', new_admin_story_path
  end

  # Return to index after create, update
  controller do
    def create
      @story = Story.new(permitted_params[:story])
      respond_to do |format|
        if @story.save
          format.html do
            redirect_to admin_stories_url, notice: 'Story successfully created.'
          end
        else
          format.html { render action: 'new' }
        end
      end
    end

    def update
      @story = Story.friendly.find(params[:id])
      respond_to do |format|
        if @story.update_attributes(permitted_params[:story])
          format.html do
            redirect_to admin_stories_url, notice: 'Story successfully updated.'
          end
        else
          format.html { render action: 'edit' }
        end
      end
    end
  end

  collection_action :sort, method: :post do
    params[:pages].each_with_index do |id, index|
      Page.update_all(['story_page_number=?', index + 1], ['id=?', id])
    end
    render nothing: true
  end
end
