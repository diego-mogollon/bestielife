class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
  end

  def dashboard
    @pet = Pet.find_by(user_id: current_user.id)
    @dashboard_categories = DashboardCategory.all
  end

  def calendar
    # @events = Event.all

      # Scope your query to the dates being shown:
      @events = Event.where(start_time: Date.today.beginning_of_week..Date.today.end_of_week)
  end
end