class WelcomeController < ApplicationController
  layout('main')
  def index
    @graph_line = open_flash_chart_object(600,300, '/charts/line')     
  end

end
