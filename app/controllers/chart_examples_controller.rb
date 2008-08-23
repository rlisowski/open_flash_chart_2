class ChartExamplesController < ApplicationController
  before_filter :render_chart
  def render_chart
    unless action_name.eql?('index') or action_name =~/^inline_.*/
      @graph = "<div>
          #{ofc2(650,300, "charts_ofc2/#{action_name}")}
        </div>
        <div>
          <a href='/charts_ofc2/#{action_name}'>To see the data in json format click here</a>
        </div>
      "
      @name = action_name.gsub('_',' ')
      @code = "# include js file on site\r"
      @code += "&nbsp;&nbsp;= javascript_include_tag 'swfobject.js'\r\r"
      @code += "# in controller\r"
      @code += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#ofc2(width, height, url, base='/', id = '')\r"
      @code += "&nbsp;&nbsp;@graph = ofc2(650,300, 'charts_ofc2/#{action_name}')\r\r"
      @code += "#in controller which is generating data for charts (for me it's charts_ofc2)"
      if File.exist?("#{RAILS_ROOT}/public/code/charts_ofc2_controller.rb")
        File.read( "#{RAILS_ROOT}/public/code/charts_ofc2_controller.rb" ).scan(/(#{action_name}_begin)(.*)(##{action_name}_end)/m)
        @code += $2.gsub!("\n","\r")
      end
      @code += "\r# display graph in view (haml)\r"
      @code += "&nbsp;&nbsp;=@graph\r"
      @code += "\r# display graph in view (html.erb)\r"
      @code += "&nbsp;&nbsp;<%=@graph%>\r"
      render :action => "show"
    end
  end
  def index
  end
  def inline_line
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot

    @graph = ofc2_inline(650,300,chart,'/','inline_line')

    @name = action_name.gsub('_',' ')
    @code = "# include js file on site\r"
    @code += "&nbsp;&nbsp;= javascript_include_tag 'swfobject.js'\r\r"
    @code += "# in controller"
    if File.exist?("#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb")
      File.read( "#{RAILS_ROOT}/public/code/charts_ofc2_inline_controller.rb" ).scan(/(#{action_name}_begin)(.*)(##{action_name}_end)/m)
      @code += $2.gsub!("\n","\r")
    end
    @code += "\r# display graph in view (haml)\r"
    @code += "&nbsp;&nbsp;=@graph\r"
    @code += "\r# display graph in view (html.erb)\r"
    @code += "&nbsp;&nbsp;<%=@graph%>\r"
    render :action => "show"
  end
end

