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
        if params[:user_id]
            if params[:rsvpd]
                @events = User.find(params[:user_id]).rsvped_events
            else
                @events = User.find(params[:user_id]).events
            end
        else
            @events = Event.all
        end
       # binding.pry
    end

    def show
        @event = Event.find(params[:id])
        @rsvp = Rsvp.new
    end

    def destroy
        Event.find(params[:id]).destroy
        redirect_to user_events_path(current_user.id)
    end

    def edit
        @event=Event.find(params[:id])
    end

    def update
        @event=Event.find(params[:id])
        @event.update(event_params)
        redirect_to event_path(@event)
    end

    private
    def event_params
        params.require(:event).permit(:title, :description, :location, :date, :user_id)
    end
end
