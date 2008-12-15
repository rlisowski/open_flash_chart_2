class ChartsOfc2Controller < ApplicationController
  #line_begin
  def line
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot
    render :text => chart.render
  end
  #line_end

  #line_dot_begin
  def line_dot
    data_1 = []
    data_2 = []
    data_3 = []
    x = 0
    y = 6.2
    while x<y
      data_1 << Math.sin(x) * 1.9 + 7
      data_2 << Math.sin(x) * 1.9 + 10
      data_3 << Math.sin(x) * 1.9 + 4
      x+=0.2
    end

    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")

    line_1 = OFC2::LineDot.new
    line_1.values= data_1
    line_1.halo_size= 0
    line_1.width= 2
    line_1.dot_size= 4

    line_2 = OFC2::LineDot.new
    line_2.values= data_2
    line_2.halo_size= 1
    line_2.width= 1
    line_2.dot_size= 4

    line_3 = OFC2::LineDot.new
    line_3.values= data_3
    line_3.halo_size= 1
    line_3.width= 6
    line_3.dot_size= 4

    y = OFC2::YAxis.new
    y.set_range(0, 15, 5)

    chart = OFC2::Graph.new
    chart.title= title
    chart << line_1
    chart << line_2
    chart << line_3
    chart.y_axis= y

    render :text => chart.render
  end
  #line_dot_end

  #line_hollow_begin
  def line_hollow
    data_1 = []
    data_2 = []
    data_3 = []
    x = 0
    y = 6.2
    while x<y
      data_1 << Math.sin(x) * 1.9 + 7
      data_2 << Math.sin(x) * 1.9 + 10
      data_3 << Math.sin(x) * 1.9 + 4
      x+=0.2
    end

    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")

    line_1 = OFC2::LineHollow.new
    line_1.values= data_1
    line_1.halo_size= 0
    line_1.width= 2
    line_1.dot_size= 4

    line_2 = OFC2::LineHollow.new
    line_2.values= data_2
    line_2.halo_size= 1
    line_2.width= 1
    line_2.dot_size= 4

    line_3 = OFC2::LineHollow.new
    line_3.values= data_3
    line_3.halo_size= 1
    line_3.width= 6
    line_3.dot_size= 4

    y = OFC2::YAxis.new
    y.set_range(0, 15, 5)

    chart = OFC2::Graph.new
    chart.title= title
    chart << line_1
    chart << line_2
    chart << line_3
    chart.y_axis= y

    render :text => chart.render
  end
  #line_hollow_end

  #many_lines_begin
  def many_lines

    data_1 = []
    data_2 = []
    data_3 = []
    0.upto(9) do |i|
      data_1 << 1 + rand(6)
      data_2 << 7 + rand(6)
      data_3 << 14 + rand(6)
    end


    line_1 = OFC2::LineDot.new
    line_1.values= data_1
    line_1.width= 4
    line_1.colour= '#DFC329'
    line_1.dot_size= 4

    line_2 = OFC2::LineHollow.new
    line_2.values= data_2
    line_2.width= 1
    line_2.colour= '#6363AC'
    line_2.dot_size= 5

    line_3 = OFC2::Line.new
    line_3.values= data_3
    line_3.colour= '#5E4725'
    line_3.width= 1
    line_3.dot_size= 5

    y = OFC2::YAxis.new
    y.set_range(0, 20, 5)

    chart = OFC2::Graph.new
    chart.y_axis= y
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    chart << line_1
    chart << line_2
    chart << line_3

    render :text => chart.render
  end
  #many_lines_end

  #bar_begin
  def bar
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::Bar.new
    bar.values= [9,8,7,6,5,4,3,2,1]
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar
    render :text => chart.render
  end
  #bar_end

  #glass_bar_begin
  def glass_bar
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::BarGlass.new
    #    data = []
    #    9.downto(0) do |i|
    #      data << OFC2::Value.new(i,'#00FF00',"main tip #{i}<br>extra tip")
    #    end
    #    bar.values= data
    bar.values= [9,8,7,6,5,4,3,2,1]
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar
    render :text => chart.render
  end
  #glass_bar_end

  #bar_3d_begin
  def bar_3d
    data = []
    0.upto(9) do |i|
      data << 2 + rand(9)
    end

    bar = OFC2::Bar3d.new
    bar.values= data
    bar.colour= '#D54C78'

    x = OFC2::XAxis.new
    x.set_3d 5
    #    x.offset= true
    x.colour= '#909090'
    x.labels_from_array= %w(1 2 3 4 5 6 7 8 9 10)

    y = OFC2::YAxis.new
    y.set_range(0, 12, 3)

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << bar
    chart.x_axis= x
    chart.y_axis= y
    render :text => chart.render
  end
  #bar_3d_end

  #sketch_bar_begin
  def sketch_bar
    data = []
    0.upto(9) do |i|
      data << 2 + rand(9)
    end

    bar = OFC2::BarSketch.new
    bar.values= data
    bar.colour= '#D54C78'

    x = OFC2::XAxis.new
    x.labels_from_array= %w(1 2 3 4 5 6 7 8 9 10)

    y = OFC2::YAxis.new
    y.set_range(0, 12, 3)

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << bar
    chart.x_axis= x
    chart.y_axis= y
    render :text => chart.render
  end
  #sketch_bar_end

  #horizontal_bar_begin
  def horizontal_bar
    data = []
    0.upto(2) do |i|
      data << OFC2::HBarValue.new(2 + rand(9), 5 + rand(9))
    end

    bar = OFC2::HBar.new
    bar.values= data
    bar.colour= '#00FF00'

    x = OFC2::XAxis.new
    x.labels_from_array= ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

    y = OFC2::YAxis.new
    y.set_offset true
    y.set_labels ["Make garden look sexy","Paint house","Move into house"]

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << bar
    chart.x_axis= x
    chart.y_axis= y
    render :text => chart.render
  end
  #horizontal_bar_end

  #stacked_bar_begin
  def stacked_bar

    bar = OFC2::BarStack.new
    bar << [2.5, 5]
    bar << [7.5]
    bar << [5, OFC2::BarStackValue.new(4, '#ff0000')]
    bar << [2, 2, 2, 2, OFC2::BarStackValue.new(2, '#ff00ff')]
    bar.colour= '#00FF00'

    x = OFC2::XAxis.new
    x.set_labels_from_array ['a', 'b', 'c', 'd']

    y = OFC2::YAxis.new

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << bar
    chart.x_axis= x
    chart.y_axis= y
    render :text => chart.render
  end
  #stacked_bar_end

  #area_begin
  def area
    data_1 = []
    x = 0
    y = 6.2
    while x<y
      data_1 << Math.sin(x) * 1.9
      x+=0.2
    end
    #    data_2 = []
    #    labels = []
    #    x = 0
    #    y = 360
    #    while x<y
    #      labels << x
    #      data_2 << "%6.2f" % Math.sin(x/Math::RAD2DEG)
    #      data_2 << "%6.2f" % Math.cos(x/Math::RAD2DEG)
    #      x+=5
    #    end

    area = OFC2::AreaHollow.new(0.35, data_1)
    area.width= 1

    x = OFC2::XAxis.new
    x.steps= 2
    x_labels = OFC2::XAxisLabels.new
    x_labels.steps= 5
    x_labels.set_vertical
    #    x.set_labels_from_array(labels)
    x.set_labels x_labels

    y = OFC2::YAxis.new
    y.set_range( -2, 2 )
    y.labels= nil
    y.set_offset false


    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart.x_axis= x
    chart.y_axis= y
    chart << area
    render :text => chart.render
  end
  #area_end

  #pie_begin
  def pie
    data_1 = [
      OFC2::PieValue.new(25, 'Safari'),
      OFC2::PieValue.new(30, 'Opera'),
      OFC2::PieValue.new(35, 'Mozilla'),
      OFC2::PieValue.new(10, 'IE')
    ]

    pie = OFC2::Pie.new
    pie.start_angle= 35
    #    pie.animate= true
    pie.values= data_1

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << pie

    render :text => chart.render
  end
  #pie_end

  #scatter_begin
  def scatter
    data_1 = [ OFC2::ScatterValue.new(0, 0) ]
    data_2 = []
    x = 0
    y = 360
    while x<y
      data_2 << OFC2::ScatterValue.new("%6.2f" % Math.sin(x/Math::RAD2DEG), "%6.2f" % Math.cos(x/Math::RAD2DEG))
      x+=5
    end


    scatter = OFC2::Scatter.new('#FFD600', 10)
    scatter.values= data_1

    circle = OFC2::Scatter.new( '#D600FF', 3)
    circle.values= data_2


    x = OFC2::XAxis.new
    x.set_range( -2, 2 )

    y = OFC2::YAxis.new
    y.set_range( -2, 2 )

    chart = OFC2::Graph.new
    chart.title= OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'))
    chart << scatter
    chart << circle
    chart.x_axis= x
    chart.y_axis= y

    render :text => chart.render
  end
  #scatter_end

  #mix_line_bar_begin
  def mix_line_bar
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.set_tip('#val#<br>Your text here for line')
    line_dot.values= [9,8,7,6,5,4,3,2,1]

    bar = OFC2::Bar.new
    bar.set_tip('#val#<br>Your text here for bar')
    bar.values= [9,8,7,6,5,4,3,2,1].reverse
    #    data = []
    #    0.upto(9) do |i|
    #      data << OFC2::Value.new(i,'#00FF00',"main tip #{i}<br>extra tip")
    #    end
    #    bar.values= data

    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot
    chart << bar
    render :text => chart.render
  end
  #mix_line_bar_end
  #mix_advanced_tooltip_begin
  def mix_advanced_tooltip
    title = OFC2::Title.new( 'All Campaigns ' + DateTime.now.strftime('%Y'), "{font-size: 14px; color: #b50F0F; text-align: center;}")

    line_dot = OFC2::LineDot.new
    line_dot.set_tip('#val#<br>Your text here for line')
    line_dot.text= 'actual sales'
    line_dot.font_size= '12'
    line_dot.colour= '#FF0000'
    line_dot.dot_size= 5

    bar = OFC2::Bar.new
    bar.set_tip('#val#<br>Your text here for bar')
    bar.text= 'forecast sales'
    line_dot.font_size= '12'
    bar.colour= '#00FF00'

    line_values= []
    bar_values= []
    max = 12

    0.upto(max) do |i|
      actual_sales = rand(i)
      forecast_sales = rand(i)

      _tooltip = "Summer Sales Blitz<br>actual sales: #{actual_sales}<br>forecast sales:#{forecast_sales}"

      line_values << OFC2::DotValue.new(actual_sales, '#FF0000', _tooltip)
      bar_values << OFC2::Value.new(forecast_sales, '#00FF00', _tooltip)
    end

    line_dot.values= line_values
    bar.values= bar_values

    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot
    chart << bar

    tooltip = OFC2::Tooltip.new
    tooltip.hover
    tooltip.stroke=5
    tooltip.shadow=true
    tooltip.colour="#e2ff60"
    tooltip.background_colour="#FFFFFF"
    tooltip.title="{font-size: 14px; font-weight: bold; color: #000000;}"
    tooltip.body="{font-size: 10px; font-weight: bold; color: #707070;}"

    chart.tooltip = tooltip

    y = OFC2::YAxis.new
    y.set_range(0, max, max/2)
    chart.y_axis= y

    chart.bg_colour= '#FFFFFF'

    render :text => chart.render
  end
  #mix_advanced_tooltip_end

  #mix_advanced_legends_begin
  def mix_advanced_legends
    title = OFC2::Title.new( 'All Campaigns ' + DateTime.now.strftime('%Y'), "{font-size: 14px; color: #b50F0F; text-align: center;}")

    line_dot = OFC2::LineDot.new
    line_dot.set_tip('#val#<br>Your text here for line')
    line_dot.text= 'actual sales'
    line_dot.font_size= '12'
    line_dot.colour= '#FF0000'
    line_dot.dot_size= 5

    bar = OFC2::Bar.new
    bar.set_tip('#val#<br>Your text here for bar')
    bar.text= 'forecast sales'
    line_dot.font_size= '12'
    bar.colour= '#00FF00'

    line_values= []
    bar_values= []
    labels = []
    max = 12

    0.upto(max) do |i|
      actual_sales = rand(i)
      forecast_sales = rand(i)
      line_values << OFC2::DotValue.new(actual_sales, '#FF0000', "actual sales: #{actual_sales}")
      bar_values << OFC2::Value.new(forecast_sales, '#00FF00', "forecast sales:#{forecast_sales}")
      labels << "label #{i}"
    end

    line_dot.values= line_values
    bar.values= bar_values


    x_labels = OFC2::XAxisLabels.new
    x_labels.steps= 1
    #    x_labels.rotate= 'vertical'
    x_labels.rotate= 'diagonal'
    #    x_labels.colour = '#A2ACBA'
    x_labels.colour = '#FF2ACB'
    x_labels.size = 12

    labels[7] = OFC2::XAxisLabel.new('7', '#0000FF', 20)
    labels[8] = OFC2::XAxisLabel.new('eight', '#8C773E', 16)
    labels[9] = OFC2::XAxisLabel.new('nine',  '#2683CF', 14)

    x_labels.labels= labels

    x = OFC2::XAxis.new
    x.set_3d 1
    x.colour= '#D7E4A3'
    x.grid_colour= '#A7E4A3'
    x.offset= true
    x.steps=4
    # Add the X Axis Labels to the X Axis
    x.labels= x_labels

    x_legend = OFC2::XLegend.new( "labels from 0 to #{max}" )
    x_legend.style= '{font-size: 20px; color: #FF8877}'

    y_legend = OFC2::YLegend.new( "Y description" )
    y_legend.style= '{font-size: 20px; color: #778877}'

    y_axis = OFC2::YAxis.new
    y_axis.set_range(0, max, max/2)


    chart = OFC2::Graph.new
    chart.title= title

    chart.x_axis= x
    chart.x_legend=x_legend
    chart.y_legend=y_legend
    chart.y_axis= y_axis


    chart << line_dot
    chart << bar





    chart.bg_colour= '#FFFFFF'

    render :text => chart.render
  end
  #mix_advanced_legends_end
end
