class ChartExamplesController < ApplicationController
  # before_filter :render_chart, :except => [:index, :inline_line, :inline_many_line]
  def render_chart
    if params[:graph_action].eql?('index') or params[:graph_action] =~/^inline_.*/
      send(params[:graph_action].to_sym)
    else
      @graph = "<div>
          #{ofc2(650,400, url_for( :controller => :charts_ofc2, :action =>params[:graph_action]), '', Time.now.usec, '/', {:wmode => 'transparent'} )}
        </div>
        <div>
          <a href='/charts_ofc2/#{params[:graph_action]}'>To see the data in json format click here</a>
        </div>
      "
      @name = params[:graph_action].gsub('_',' ')
      if File.exist?("#{Rails.root}/public/code/charts_ofc2_controller.rb")
        File.read( "#{Rails.root}/public/code/charts_ofc2_controller.rb" ).scan(/(#{params[:graph_action]}_begin)(.*)(##{params[:graph_action]}_end)/m)
        method_code =  $2 if $2
      end
      @code =<<-EOF
        # include js file on site
          = javascript_include_tag 'swfobject.js'

        # in controller
                  #ofc2(width, height, url, base='/', id = '')
          @graph = ofc2(650,300, 'charts_ofc2/#{params[:graph_action]}')

        #in controller which is generating data for charts (for me it's charts_ofc2)
          #{method_code}

        # display graph in view (haml)
          =@graph
      EOF
      render :action => "show"
    end
  end
  def index
  end
  def inline_line
    title = OFC2::Title.new( :text => params[:graph_action].humanize , :style => "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    line_dot.colour = '#FFAAFF'

    line_dot_2 = OFC2::Line.new
    line_dot_2.values= [9,8,7,6,5,4,3,2,1].reverse

    chart = OFC2::Graph.new
    chart.title= title

    chart << line_dot
    chart << line_dot_2

    @graph = ofc2_inline(650,300,chart,'inline_line')

    @name = params[:graph_action].gsub('_',' ')

    if File.exist?("#{Rails.root}/public/code/charts_ofc2_inline_controller.rb")
      File.read( "#{Rails.root}/public/code/charts_ofc2_inline_controller.rb" ).scan(/(#{params[:graph_action]}_begin)(.*)(##{params[:graph_action]}_end)/m)
      method_code = $2 if $2
    end
    @code =<<EOF
# include js file on site
<%= javascript_include_tag 'swfobject.js' %>

# when you use ofc2_inline method you don't neeed extra controller which serving data

# lets say you have a controller Charts
class ChartsController < ApplicationController
  # and action inline_line
  #{method_code}
end
# notice that instead url (like was in another examples) we set an chart object
# @graph = ofc2_inline(650,300,chart,'inline_line')
# the 4th parameter is id, if you not set it, it will be automaticaly generated
# every inline chart generated on the same page must have unique id!

# ok, we have controller and action, now display graph in a view for that action
# for this tiny example it is app/views/charts/inline_line.html.erb
<%=@graph%>
EOF

    render :action => "show"
  end
  def inline_many_line
    title = OFC2::Title.new( :text => params[:graph_action].humanize , :style => "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    line_dot.colour = '#00FF00'
    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot

    @graph = ofc2_inline(650,300,chart,'inline_line')

    title = OFC2::Title.new( :text => params[:graph_action].humanize , :style => "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::Bar.new
    bar.values= [9,8,7,6,5,4,3,2,1]
    bar.colour = '#FF0000'
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar

    @graph += ofc2_inline(650,300,chart,'inline_line_2')

    @name = params[:graph_action].gsub('_',' ')
    if File.exist?("#{Rails.root}/public/code/charts_ofc2_inline_controller.rb")
      File.read( "#{Rails.root}/public/code/charts_ofc2_inline_controller.rb" ).scan(/(#{params[:graph_action]}_begin)(.*)(##{params[:graph_action]}_end)/m)
      method_code = $2 if $2
    end
    @code =<<EOF
# include js file on site
<%= javascript_include_tag 'swfobject.js' %>

# when you use ofc2_inline method you don't neeed extra controller which serving data

# lets say you have a controller Charts
class ChartsController < ApplicationController
  # and action inline_many_line
  #{method_code}
end
# notice that instead url (like was in another examples) we set an chart object
# @graph = ofc2_inline(650,300,chart,'inline_line')
# the 4th parameter is id, if you not set it, it will be automaticaly generated (another for each chart)
# every inline chart generated on the same page must have unique id!

# ok, we have controller and action, now display graph in a view for that action
# for this tiny example it is app/views/charts/inline_many_line.html.erb
<%=@graph %>
<%=@seccond_graph %>

EOF
    render :action => "show"
  end
end

