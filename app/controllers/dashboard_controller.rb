class DashboardController < ApplicationController
  # check_authorization
  def index
    @users = User.all
  end
end
