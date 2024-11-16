class EventsController < ApplicationController
  before_action :set_event, only: [:show, :attend]

  def index
    @events = Event.all
    render
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.create(event_params)
    redirect_to events_path
  end

  def attend
    if !@event.attendees.include?(current_user)
      @event.attendees << current_user
      flash[:notice] = "you have joined this event!"
    else
      flash[:alert] = "you are already attending!!"
    end
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

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
