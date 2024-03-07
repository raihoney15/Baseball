class Api::V1::EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    # skip_before_action :authenticate_user!defaults: { format: 'json' }


    
    def live_event_listing
    live_events = Event.where(is_live: true)
    render json: { status: 'success', message: 'These are the live events', data: live_events }, status: :ok
    end
    
    def over_event_listing
    over_matches = Event.where(is_live: false)
    render json: { status: 'success', message: 'These are the completed events', data: over_matches }, status: :ok
    end
    
    def upcoming_event_listing
        upcoming_events = Event.where('start_date > ?', Date.today).where(is_live: nil)
        render json: { status: 'success', message: 'These are the upcoming events', data: upcoming_events}, status: :ok
    end
 
end
