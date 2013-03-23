module AreasHelper
  def create_area_data
    @areas = Area.all
    #gon.area_data = @areas.as_json(:only => [:country, :climbs_count])
    
  end
end
