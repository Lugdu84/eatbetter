class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_navbar

  def set_navbar
    @navbar = true
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
