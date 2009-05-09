class Documentations::GraphController < ApplicationController
  def index
    chart = OFC2::Graph.new
    @simple_chart = ofc2_inline(650,300,chart,'inline_line')
  end
  def title
    title = OFC2::Title.new

    chart = OFC2::Graph.new(:title => title)

    @simple_chart = ofc2_inline(650,300,chart,'inline_line')
  end

  def elements
    title = OFC2::Title.new( :text => 'elements')
    line_dot = OFC2::Line.new( :values => [9,8,7,6,5,4,3,2,1,12] )
    chart = OFC2::Graph.new(:title => title)
    chart << line_dot

    @simple_chart_1 = ofc2_inline(650,300,chart,'inline_line')

    title = OFC2::Title.new( :text => 'elements')
    line_dot = OFC2::Line.new( :values => [9,8,7,6,5,4,3,2,1,12] )
    chart = OFC2::Graph.new(:title => title, :elements => [line_dot])
    @simple_chart_2 = ofc2_inline(650,300,chart,'inline_line_2')
  end

  def radar_axis
  end

  def x_axis
  end

  def y_axis
  end

  def y_axis_right
  end

  def x_legend
  end

  def y_legend
  end

  def y2_legend
  end

  def bg_colour
  end
end
