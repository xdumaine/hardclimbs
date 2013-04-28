class HomeController < ApplicationController
  include Carmen
  def index
    #@climbers = Climber.all
    @areas = Area.all
    @area_climb_count = {}
    @area_links = {}
    @area_ascent_count = {}
    @areas.each do |a|
      @c = Country.named(a.country)
      if !@c.nil?
        if @area_climb_count.has_key?(@c.code)
          @area_climb_count[@c.code] += a.climbs_count
          @area_ascent_count[@c.code] += a.ascents_count
          @area_ascent_count[@c.code] += a.ascents_count
        else
          @area_climb_count[@c.code] = a.climbs_count
          @area_ascent_count[@c.code] = a.ascents_count
          @area_links[@c.code] = areas_path.to_s + "?country=" + a.country
        end
      end
    end
    gon.area_climb_count = @area_climb_count
    gon.area_links = @area_links
    gon.area_ascent_count = @area_ascent_count
  end
end
