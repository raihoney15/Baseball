  

  namespace :event do
    desc "Check if any activity has occurred for events"
    task check_events_activity: :environment do
      events = Event.all
      events.each do |event|
        if event.last_activity_at.nil? || event.last_activity_at < 5.minutes.ago
          user = User.find_by(id: event.user_id)
          if user.present?
            UserMailer.notify_no_moves_played(user, event).deliver_now
          end
        end
      end
    end
  end
  