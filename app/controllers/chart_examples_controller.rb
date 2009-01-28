class ChartExamplesController < ApplicationController
  before_filter :render_chart
  def render_chart
    unless action_name.eql?('index') or action_name =~/^inline_.*/
      @graph = "<div>
          #{ofc2(650,300, url_for( :controller => :charts_ofc2, :action =>action_name), '' )}
        </div>
        <div>
          <a href='/charts_ofc2/#{action_name}'>To see the data in json format click here</a>
        </div>
      "
      @name = action_name.gsub('_',' ')
      if File.exist?("#{RAILS_ROOT}/public/code/charts_ofc2_controller.rb")
        File.read( "#{RAILS_ROOT}/public/code/charts_ofc2_controller.rb" ).scan(/(#{action_name}_begin)(.*)(##{action_name}_end)/m)
        method_code =  $2 if $2
      end
      @code =<<EOF
# include js file on site
  = javascript_include_tag 'swfobject.js'

# in controller
          #ofc2(width, height, url, base='/', id = '')
  @graph = ofc2(650,300, 'charts_ofc2/#{action_name}')

#in controller which is generating data for charts (for me it's charts_ofc2)
  #{method_code}

# display graph in view (haml)
  =@graph

# display graph in view (html.erb)
  <%=@graph%>
EOF
      render :action => "show"
    end
  end
  def index
  end
  def inline_line
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    line_dot.colour = '#FFAAFF'

    line_dot_2 = OFC2::Line.new
    line_dot_2.values= [9,8,7,6,5,4,3,2,1].reverse

    chart = OFC2::Graph.new
    chart.title= title

    chart << line_dot
    chart << line_dot_2

    @graph = ofc2_inline(650,300,chart,'/','inline_line')

    @name = action_name.gsub('_',' ')

    if File.exist?("#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb")
      File.read( "#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb" ).scan(/(#{action_name}_begin)(.*)(##{action_name}_end)/m)
      method_code = $2 if $2
    end
    @code =<<EOF
# include js file on site
  = javascript_include_tag 'swfobject.js'

# in controller
          #ofc2(width, height, url, base='/', id = '')
  @graph = ofc2(650,300, 'charts_ofc2/#{action_name}')

#in controller which is generating data for charts (for me it's charts_ofc2)
  #{method_code}

# display graph in view (haml)
  =@graph

# display graph in view (html.erb)
  <%=@graph%>
EOF

    render :action => "show"
  end
  def inline_many_line
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    line_dot.colour = '#00FF00'
    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot

    @graph = ofc2_inline(650,300,chart,'/','inline_line')

    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::Bar.new
    bar.values= [9,8,7,6,5,4,3,2,1]
    bar.colour = '#FF0000'
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar

    @graph += ofc2_inline(650,300,chart,'/','inline_line_2')

    @name = action_name.gsub('_',' ')
    if File.exist?("#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb")
      File.read( "#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb" ).scan(/(#{action_name}_begin)(.*)(##{action_name}_end)/m)
      method_code = $2 if $2
    end
    @code =<<EOF
# include js file on site
  = javascript_include_tag 'swfobject.js'

# in controller
          #ofc2(width, height, url, base='/', id = '')
  @graph = ofc2(650,300, 'charts_ofc2/#{action_name}')

#in controller which is generating data for charts (for me it's charts_ofc2)
  #{method_code}

# display graph in view (haml)
  =@graph
  =@graph2

# display graph in view (html.erb)
  <%=@graph%>
  <%=@graph2%>
EOF
    render :action => "show"
  end
end

