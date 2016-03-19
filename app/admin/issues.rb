ActiveAdmin.register Issue do
  permit_params :cover_image,
                :cover_image_file_name,
                :cover_image_content_type,
                :cover_image_file_size,
                :cover_image_updated_at,
                :issue_number,
                :position,
                :purchase_url,
                :rating,
                :title,
                :issue_pages,
                pages_attributes: [:id, :issue_page_number, :issue_id]

  config.sort_order = "position_asc"

  index do
    selectable_column
    column :issue do |issue|
      content_tag :h3, issue.title
    end
    column :cover_image do |issue|
      image_tag(issue.cover_image.url(:thumb))
    end
    column :rating
    column :pages do |issue|
      issue.pages.ordered_for_issue.count
    end
    actions
  end

  index as: :grid do |issue|
    link_to admin_issue_path(issue) do
      image_tag(issue.cover_image.url(:thumb)) + "<h4>#{issue.title}</h4>".html_safe
    end
  end

  form html: {multipart: true} do |f|
    f.actions
    f.inputs t('admin.issue.form_title'), class: 'inputs issue' do
      f.semantic_errors(*f.object.errors.keys)
      f.input :title
      f.input :rating, as: :select, collection: Issue.ratings.keys
      f.input :issue_number
      f.input :cover_image,
              image_preview: true,
              hint: t('admin.issue.cover_image_hint')
      f.input :purchase_url
      f.input :position
    end
    f.inputs t('admin.issue_pages.form_title'), class: 'inputs issue_pages' do
      f.has_many :pages,
                 for: [:pages, f.object.pages.ordered_for_story],
                 sortable: :issue_page_number,
                 sortable_start: 1,
                 heading: false,
                 allow_destroy: false,
                 new_record: false do |pf|
        pf.input :issue_page_number, as: :page_sorting, label: false
      end
    end
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

  # Add New Issue button to show page, for quick editing
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
            redirect_to admin_issues_url, notice: 'Issue successfully updated.'
          end
        else
          format.html { render action: 'edit' }
        end
      end
    end
  end

end
