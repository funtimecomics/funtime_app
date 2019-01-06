# frozen_string_literal: true

class PageSortingInput < Formtastic::Inputs::StringInput
  include ActionView::Helpers::UrlHelper
  def to_html
    input_wrapping do
      label_html <<
        builder.text_field(method, input_html_options.merge(readonly: 'true')) <<
        image_preview_content <<
        link_to('Edit page', Rails.application.routes.url_helpers.edit_admin_page_path(@object))
    end
  end

  private

  def image_preview_content
    image = @object.image
    return '' if image.blank?

    template.image_tag(image.url(:medium), class: 'image-preview')
  end
end
