class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
  end

  def dashboard
    @pet = Pet.find_by(user_id: current_user.id)
    @dashboard_categories = DashboardCategory.all
  end
end