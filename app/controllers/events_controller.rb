class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def create
        #binding.pry
        @event = Event.new(event_params)
        if @event.save
            redirect_to user_events_path(current_user.id)
        end

    end

    def index
        @events = User.find(params[:user_id]).events
        #binding.pry
    end

    def show
        @event = Event.find(params[:id])
    end


    private
    def event_params
        params.require(:event).permit(:title, :description, :location, :date, :user_id)
    end
end
