class ChartExamplesController < ApplicationController
  before_filter :render_chart
  def render_chart
    @graph = "<div>
      #{ofc2(650,300, "charts_ofc2/#{action_name}") unless action_name.eql?('index')}
    </div>
    <div>
      <a href='/charts_ofc2/#{action_name}'>view data</a>
    </div>
      "
  end
end

