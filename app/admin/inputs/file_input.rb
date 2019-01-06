# frozen_string_literal: true

# Source: http://viget.com/extend/8-insanely-useful-activeadmin-customizations
class FileInput < Formtastic::Inputs::FileInput
  def to_html
    input_wrapping do
      label_html <<
        image_preview_content <<
        builder.file_field(method, input_html_options)
    end
  end

  private

  def image_preview_content
    image_preview? ? image_preview_html : ''
  end

  def image_preview?
    options[:image_preview] && @object.send(method).present?
  end

  def image_preview_html
    template.image_tag(@object.send(method).url(:thumb),
                       class: 'image-preview')
  end
end
