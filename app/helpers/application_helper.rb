# General helpers
module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def rating_dot(story)
    content_tag(:span, class: "rating rating-#{story.rating || 'unrated'}") do
      story.rating || 'unrated'
    end
  end

  def rating_info(story)
    case story.rating
    when 'green' then 'This story should be suitable for all ages'
    when 'yellow' then 'This story may not be suitable for young children'
    when 'red' then 'This story is suitable for adults'
    when 'blue'
      'This story contains material some adults may find objectionable'
    else
      'This story hasn\'t been rated for age-appropriateness'
    end
  end
end
