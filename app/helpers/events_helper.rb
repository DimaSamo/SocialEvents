module EventsHelper
    def rsvpd?(event_id, user_id)
        rsvp = Rsvp.find_by(event_id: event_id, user_id: user_id)
        if rsvp && rsvp.attending
            return true
        else
            return false
        end
    end
end
