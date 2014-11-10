ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel t('admin.dashboard.recent_stories') do
          ul do
            Story.recent(10).map do |story|
              li link_to(story.name, admin_story_path(story))
            end
          end
        end
      end
      column do
        panel t('admin.dashboard.recent_artists') do
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
