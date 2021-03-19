class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_navbar

  def set_navbar
    @navbar = true
  end
end
