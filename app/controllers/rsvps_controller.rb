class RsvpsController < ApplicationController
    def create
        @rsvp = Rsvp.new(rsvp_params)
        @rsvp.save
        redirect_to event_path(params[:rsvp][:event_id])
    end

    def show
        @rsvp = Rsvp.find(params[:id])
        respond_to do |format|
            format.json { render json: @rsvp }
        end
    end

    def update
        @rsvp = Rsvp.find_by(user_id: params[:rsvp][:user_id], event_id: params[:rsvp][:event_id])
        @rsvp.update(rsvp_params)
    end

    def destroy
        @rsvp = Rsvp.find(params[:id])
        #binding.pry
        @rsvp.destroy
        redirect_to root_path
        
    end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attending, :event_id, :user_id, :note)
    end
end
