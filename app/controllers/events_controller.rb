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
        @rsvp = Rsvp.new
    end

    def destroy
        Event.find(params[:id]).destroy
        redirect_to user_events_path(current_user.id)
    end


    private
    def event_params
        params.require(:event).permit(:title, :description, :location, :date, :user_id)
    end
end
