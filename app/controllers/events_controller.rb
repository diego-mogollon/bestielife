class EventsController < ApplicationController
    def index
        @events = Event.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
    end
    def new 
        @event = Event.new
    end
    def create
        @pet = Pet.find_by(user_id: current_user.id)
        @event = Event.new(event_params)
        @event.pet = @pet
        if @event.save
            redirect_to events_path
        else
            render new
        end 
    end
    
    private
    def event_params
        params.require(:event).permit(:start_time, :end_time, :name, :description)
    end
end