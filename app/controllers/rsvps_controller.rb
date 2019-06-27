class RsvpsController < ApplicationController
    def create
        @rsvp = Rsvp.new(rsvp_params)
        binding.pry
    end

    def update
    end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attending, :event_id, :user_id)
    end
end
