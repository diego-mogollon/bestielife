class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.all
        if params[:start_date]
            @weekly_events = Event.where(start_time: params[:start_date].to_date.beginning_of_week..params[:start_date].to_date.end_of_week)
            @monthly_events = Event.where(start_time: params[:start_date].to_date.beginning_of_month..Date.today.end_of_month)
        else
            @weekly_events = Event.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
            @monthly_events = Event.where(start_time: Date.today.beginning_of_month..Date.today.end_of_month)
        end
        
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
            flash[:notice] = "Event added successfully"
            redirect_to event_path(@event)
        else
            flash[:alert] = "Event could not be added. Please try again"
            render new
        end 
    end
    
    def edit

    end

    def update
        if @event.update(event_params)
            flash[:notice] = "Event updated successfully"
            redirect_to event_path(@event)
        else
            flash[:alert] = "Event could not be updated. Please try again"
            render :edit
        end
    end

    def destroy        
        @event.destroy
        flash[:alert] = "Your event was cancelled"
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