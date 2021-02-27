class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
  end

  def dashboard
    @pet = current_user.pet
    @dashboard_categories = DashboardCategory.all
  end
end