ActiveAdmin.register Issue do
  permit_params :cover_image,
                :cover_image_file_name,
                :cover_image_content_type,
                :cover_image_file_size,
                :cover_image_updated_at,
                :title,
                :issue_number,
                :position

  index do
    selectable_column
    column :issue do |issue|
      content_tag :h3, issue.title
    end
    column :cover_image do |issue|
      image_tag(issue.cover_image.url(:thumb))
    end
    actions
  end

  form html: {multipart: true} do |f|
    f.inputs t('admin.story.form_title'), class: 'inputs story' do
      f.semantic_errors(*f.object.errors.keys)
      f.input :title
      f.input :issue_number
      f.input :cover_image,
              image_preview: true,
              hint: t('admin.story.cover_image_hint')
      f.input :position
    end
    f.actions
  end

  show do |issue|
    attributes_table do
      row :cover_image_file_name
      row :cover_image_content_type
      row :cover_image_file_size
      row :cover_image_updated_at
      row :cover_image do
        image_tag issue.cover_image.url(:thumb)
      end
    end
  end

  # Add New Story button to show page, for quick editing
  action_item only: [:show] do
    link_to 'New Issue', new_admin_issue_path
  end

  # Return to index after create, update
  controller do
    def create
      @issue = Issue.new(permitted_params[:issue])
      respond_to do |format|
        if @issue.save
          format.html do
            redirect_to admin_issues_url, notice: 'Issue successfully created.'
          end
        else
          format.html { render action: 'new' }
        end
      end
    end

    def update
      @issue = Issue.friendly.find(params[:id])
      respond_to do |format|
        if @issue.update_attributes(permitted_params[:issue])
          format.html do
            redirect_to admin_stories_url, notice: 'Issue successfully updated.'
          end
        else
          format.html { render action: 'edit' }
        end
      end
    end
  end

end
