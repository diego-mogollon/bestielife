class EventsController < ApplicationController
    def index
        @events = Event.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
    end
end