class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :home]
  def home
  end

  def dashboard
    @pet = current_user.pet
    @dashboard_categories = DashboardCategory.all
  end

  def about
  end
end
