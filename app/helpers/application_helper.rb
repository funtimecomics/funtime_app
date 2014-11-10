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
    case story.rating.to_sym
    when :green then t('story.rating.green')
    when :yellow then t('story.rating.yellow')
    when :red then t('story.rating.red')
    when :blue then t('story.rating.blue')
    else t('story.rating.unrated')
    end
  end
end
