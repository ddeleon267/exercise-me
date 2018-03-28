class StaticController < ApplicationController
  before_action :redirect_if_logged_in

  def index
    # binding.pry

  end

end
