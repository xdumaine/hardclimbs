class HomeController < ApplicationController
  def index
    @climbers = Climber.all
    #@areas = Area.all
    #@bar = {}
    #@areas.each do |a|
     # @c = Country.find_country_by_name(a.country)
     # if !@c.nil?
     #   if @bar.has_key?(@c.alpha2)
     #     @bar[@c.alpha2] += a.climbs_count
     #   else
      #    @bar[@c.alpha2] = a.climbs_count
     #   end
     # end
    #end
    #gon.area_data = @bar
  end
end
