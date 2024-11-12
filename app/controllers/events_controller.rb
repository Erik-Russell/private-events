class EventsController < ApplicationController

  def index
    @events = Event.all
    render
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.create(event_params)
    redirect_to events_path
  end

  private

  def require_login
    if user_signed_in?
      # allow user to perform actions
    else
      redirect_to new_user_session_path
    end
  end

  def event_params
    params.expect(event: [:location, :date])
  end
end
