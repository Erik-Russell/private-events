class EventsController < ApplicationController

  def index
    @events = Event.all
    render
  end

end
