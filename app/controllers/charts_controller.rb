class ChartsController < ApplicationController
  def line
    g = Graph.new
    g.title( 'Users vs. Ram - 24h statistics', '{color: #7E97A6; font-size: 20; text-align: center}' )
    g.set_bg_color('#FFFFFF')
    g.set_data([289,198,143,126,98,96,124,164,213,238,256,263,265,294,291,289,306,341,353,353,402,419,404,366,309])
    g.line_dot( 2, 4, '#818D9D', 'Max Users', 10 )
    g.set_data([698,1101,1324,1396,1568,1571,1496,1349,1140,1045,966,926,906,754,766,757,672,510,431,436,227,533,566,744,1004])
    g.line_hollow( 2, 4, '#164166', 'Free Ram', 10 )
    g.attach_to_y_right_axis(2)
    g.set_y_max(600)
    g.set_y_right_max(1700)
    g.set_x_axis_color('#818D9D', '#F0F0F0' )
    g.set_y_axis_color( '#818D9D', '#ADB5C7' )
    g.y_right_axis_color('#164166' )
    g.set_x_legend( 'My IRC Server', 12, '#164166' )
    g.set_y_legend( 'Max Users', 12, '#164166' )
    g.set_y_legend_right( 'Free Ram (MB)' ,12 , '#164166' )
    tmp = []
    (0..25).to_a.each do |x|
      tmp << "#{x}:00"
    end
    g.set_x_labels(tmp)
    g.set_x_label_style(10, '#164166', 0, 3, '#818D9D' )
    g.set_y_label_steps(5)
  
    render :text => g.render

  end

  def bar
  end

  def bar_3d
  end

end
