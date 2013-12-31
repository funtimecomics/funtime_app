ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Stories" do
          ul do
            Story.recent(10).map do |story|
              li link_to(story.name, admin_story_path(story))
            end
          end
        end
      end
      column do
        panel "Recent Artists" do
          ul do
            Person.recent(10).map do |person|
              li link_to(person.name, admin_person_path(person))
            end
          end
        end
      end
    end
  end # content
end
