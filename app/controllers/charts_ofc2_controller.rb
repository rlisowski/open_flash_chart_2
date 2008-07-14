class ChartsOfc2Controller < ApplicationController
  def line
    line = OFC2::Line.new
    line.set_values [9,8,7,6,5,4,3,2,1]
    line.dot_size= 10
    line.halo_size= 20
    line.font_size= 30
    
    chart = OFC2::Graph.new
    
    title = OFC2::Title.new( "Title", "{font-size: 20px; color: #FF0F0F; text-align: left;}" )
    
    chart.title= title #like   " chart.set_title title " but more ruby
    chart.add_element(line)
    
    x = OFC2::XAxis.new
    x.set_colour '#FF00BB'
    x.set_grid_colour '#0f0f0f'
    x.set_labels ['a','b','c','d','e','f','g','h','i']
    chart.set_x_axis x
  
    render :text => chart.render

  end

  def bar
  end

  def bar_3d
  end

end
