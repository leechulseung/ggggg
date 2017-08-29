class HomeController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_admin
  
  def main
  end
end
