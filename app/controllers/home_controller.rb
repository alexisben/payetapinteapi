class HomeController < ApplicationController
  def index
    @bars = Bar.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bars }
    end
    @users = User.all

  end
end
