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
    return t('story.rating.unrated') unless story.rating
    case story.rating.to_sym
    when :green then t('story.rating.green')
    when :yellow then t('story.rating.yellow')
    when :red then t('story.rating.red')
    when :blue then t('story.rating.blue')
    else t('story.rating.unrated')
    end
  end
  
  def badge(story)
    if badge_type = story.badge
      content_tag(:span, class: 'badge') do
        t("story.badge.#{badge_type}")
      end
    end
  end
  
  def creator_list(creators, current_creator=nil)
    if current_creator
      creators = creators.to_a.delete_if{|p| p == current_creator}
      if creators.size > 1
        "(with others)"
      elsif creators.size > 0
        creator_links = creators.map{|creator| link_to creator.name, creator}.join(', ').html_safe
        "(with #{creator_links})".html_safe
      end
    else
      if creators.count > 2
        "Various Artists"
      else
        creators.map{|creator| link_to creator.name, creator}.join(', ').html_safe
      end
    end
    
  end
end
