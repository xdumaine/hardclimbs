class HomeController < ApplicationController
  include Carmen
  def index
    #@climbers = Climber.all
    @areas = Area.all
    @area_names = {}
    @area_links = {}
    @areas.each do |a|
      @c = Country.named(a.country)
      if !@c.nil?
        if @area_names.has_key?(@c.code)
          @area_names[@c.code] += a.climbs_count
        else
          @area_names[@c.code] = a.climbs_count
          @area_links[@c.code] = areas_path.to_s + "?country=" + a.country
        end
      end
    end
    gon.area_data = @area_names
    gon.area_links = @area_links
  end
end
