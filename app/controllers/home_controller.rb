class HomeController < ApplicationController
  def index
    @climbers = Climber.all
  end
end
