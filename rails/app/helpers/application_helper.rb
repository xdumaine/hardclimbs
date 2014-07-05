module ApplicationHelper
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  def sortable(column, title = nil, join_model = nil)  
    title ||= column.titleize  
    #css_class = (column == sort_column) ? "current #{sort_direction}" : nil 
    
    css_class = (column == sort_column) ? content_tag(:i, "", :class => (sort_direction == "asc" ? "icon-arrow-up" : "icon-arrow-down")) : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    style_title = (column == sort_column) ? css_class + title : title
    link_to style_title, {:join_model => join_model, :sort_column => column, :sort_direction => direction},
                    :rel => "tooltip", :title => "Sort by #{title}"
    
    # store sorting data in session objects                
    #session[:direction] = direction
    #session[:join_model] = join_model
    #session[:colum] = column
    # debugger
  end
  
end
