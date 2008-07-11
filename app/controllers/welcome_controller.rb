class WelcomeController < ApplicationController
  layout('main')
  def index
    @graph_line = ofc2(600,300, 'charts_ofc2/line')
  end

end
