class ChartsOfc2Controller < ApplicationController
  #inline_line_begin
  def inline_line
    title = OFC2::Title.new( DateTime.now.strftime('%Y-%m-%d %H:%M'), "{font-size: 14px; color: #b50F0F; text-align: center;}")
    line_dot = OFC2::Line.new
    line_dot.values= [9,8,7,6,5,4,3,2,1]
    chart = OFC2::Graph.new
    chart.title= title
    chart << line_dot
    @graph = ofc2_inline(650,300,chart)
  end
  #inline_line_end
end
