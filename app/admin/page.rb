# frozen_string_literal: true

ActiveAdmin.register Page do
  permit_params :id,
                :image_content_type,
                :image_file_name,
                :image_file_size,
                :image_updated_at,
                :image,
                :issue_id,
                :issue_page_number,
                :description,
                :story_id,
                :story_page_number
  index do
    selectable_column
    column :image do |page|
      image_tag page.image.url(:thumb)
    end
    column :description do |page|
      page.description.try(:html_safe)
    end
    column :story do |page|
      story = page.story
      page_number = ' page ' + page.story_page_number.to_s
      link_to story.name + page_number, edit_admin_story_path(story)
    end
    column :issue do |page|
      issue = page.try(:issue)
      if issue
        page_number = ' page ' + page.issue_page_number.to_s
        link_to issue.title + page_number, edit_admin_issue_path(issue)
      else
        'None'
      end
    end
    actions
  end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs t('admin.page.form_title'), multipart: true do
      f.semantic_errors(*f.object.errors.keys)
      f.input :image,
              image_preview: true,
              hint: t('admin.page.image_hint')
      f.input :story, as: :select, collection: Story.alphabetical
      f.input :story_page_number
      f.input :issue, as: :select, collection: Issue.ordered
      f.input :issue_page_number
      f.input :description, as: :html_editor
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.includes :story, :issue
    end

    # Return to index after create
    def create
      @page = Page.new(permitted_params[:page])
      respond_to do |format|
        if @page.save
          format.html do
            redirect_to admin_pages_url, notice: 'Page successfully created.'
          end
        else
          format.html { render action: 'new' }
        end
      end
    end

    # Return to index after update
    def update
      @page = Page.find(params[:id])
      respond_to do |format|
        if @page.update(permitted_params[:page])
          format.html do
            redirect_to admin_pages_url, notice: 'Page successfully updated.'
          end
        else
          format.html { render action: 'edit' }
        end
      end
    end
  end
end
