class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
    end

    def show

    end

    def new 
        @event = Event.new
    end

    def create
        @pet = current_user.pet
        @event = Event.new(event_params)
        @event.pet = @pet
        if @event.save
            redirect_to event_path(@event)
        else
            render new
        end 
    end
    
    def edit

    end

    def update
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
    end

    def destroy        
        @event.destroy
        flash[:alert] = "Your current booking was cancelled"
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:start_time, :end_time, :name, :description)
    end

    def find_event
        @event = Event.find(params[:id])
    end
end