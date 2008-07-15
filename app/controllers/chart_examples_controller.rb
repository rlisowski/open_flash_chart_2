class ChartExamplesController < ApplicationController
  before_filter :render_chart
  def render_chart
    unless action_name.eql?('index')
      @graph = "<div>
          #{ofc2(650,300, "charts_ofc2/#{action_name}")}
        </div>
        <div>
          <a href='/charts_ofc2/#{action_name}'>To see the data in json format click here</a>
        </div>
      "
      @name = action_name.gsub('_',' ')
      render :action => "show"
    end
  end
  def index
    
  end
end

