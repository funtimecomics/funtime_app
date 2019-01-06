# frozen_string_literal: true

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

  def rating_info(rateable)
    rateable_class = rateable.class.name.downcase
    return t("#{rateable_class}.rating.unrated") unless rateable.rating

    case rateable.rating.to_sym
    when :green then t("#{rateable_class}.rating.green")
    when :yellow then t("#{rateable_class}.rating.yellow")
    when :red then t("#{rateable_class}.rating.red")
    when :blue then t("#{rateable_class}.rating.blue")
    else t("#{rateable_class}.rating.unrated")
    end
  end

  def badge(badgeable)
    if badge_type = badgeable.badge
      content_tag(:span, class: 'badge') do
        t("#{badgeable.class.name.downcase}.badge.#{badge_type}")
      end
    end
  end

  def creator_list(creators, current_creator = nil)
    if current_creator
      creators = creators.to_a.delete_if { |p| p == current_creator }
      if creators.size > 1
        '(with others)'
      elsif !creators.empty?
        creator_links = creators.map { |creator| link_to creator.name, creator }.join(', ').html_safe
        "(with #{creator_links})".html_safe
      end
    else
      if creators.count > 2
        'Various Artists'
      else
        creators.map { |creator| link_to creator.name, creator }.join(', ').html_safe
      end
    end
  end
end
