require 'json'
module OFC2
  module OWJSON
    def to_hash
      self.instance_values
    end
    alias :to_h :to_hash
    def to_json
      to_hash.to_json
    end
  end
  def self.included(controller)
    controller.helper_method(:ofc2)
  end
  def ofc2(width, height, url, base='', id = '')
    out = []
    obj_id = 'chart'
    div_name = 'flashcontent'
    obj_id   += id
    div_name += id
    out << '<div id="' + div_name.to_s + '"></div>'
    out << '<script type="text/javascript">'
    out << 'swfobject.embedSWF('
    out << '"open-flash-chart.swf", "' + div_name.to_s + '",'
    out << '"' + width.to_s + '", "' + height.to_s + '", "9.0.0", "expressInstall.swf",'
    out << '{"data-file":"' + base.to_s + url.to_s + '"} );'
    out << '</script>'
    return out.join("\n")
  end
  
  class Element
    include OWJSON
    def initialize(text = '', css = "{font-size: 20px; color: #FF0F0F; text-align: center;}")
      set_text(text)
      set_style(css)
    end
    %w(style text).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  class XLegend <  Element 
  end
  class Title < Element 
  end
  class YLegend <  Element  
  end



  # y_axis
  class YAxisBase
    include OWJSON
    %w(stroke tick_length colour grid_colour min max steps labels).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
	
    def set_colours( colour, grid_colour )
      set_colour( colour )
      set_grid_colour( grid_colour )
    end
    alias_method :colours=, :set_colours
	
    def set_range( min, max, steps=1 )
      set_min(min)
      set_max(max)
      set_steps( steps )
    end
    alias_method :range=, :set_range
	
    def set_offset( off )
      @offset = off ? 1 : 0
    end
    alias_method :offset=, :set_offset
  end

  class YAxis < YAxisBase
    def set_grid_colour(color = '#ff0000')
      @grid__colour = color
    end
    alias_method :grid_color=, :set_grid_color
  end	

  class YAxisRight < YAxisBase 
  end

  # x_axis
  class XAxis 
    include OWJSON
    %w(stroke tick_length colour tick_height grid_colour min max steps labels 3d).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
	
    def set_colours( colour, grid_colour )
      set_colour( colour )
      set_grid_colour( grid_colour )
    end
	
	
    # o is a boolean
    def set_offset( o )
      @offset = o ? true : false
    end
    def to_hash
      self.instance_values
    end
    alias :to_h :to_hash
    def to_json
      to_hash.to_json
    end
    # helper def to make the examples
    # simpler.
    #
    def set_labels_from_array( a )
      x_axis_labels = XAxisLabels.new
      x_axis_labels.set_labels( a )
      @labels = x_axis_labels
		
      if( isset( @steps ) )
        x_axis_labels.set_steps( @steps )
      end
	
      def set_range( min, max )
        set_min(min)
        set_max(max)
      end
    end
  end
  
  class XAxisLabel
    include OWJSON
    def initialize( text, colour, size, rotate )
      set_text( text )
      set_colour( colour )
      set_size( size )
      set_rotate( rotate )
    end
	
    %w(text colour size rotate visible).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
	
    def set_vertical()
      @rotate = "vertical"
    end
	
  end
  class XAxisLabels
    include OWJSON
    %w(steps labels colour size).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
	
    def set_vertical()
      @rotate = "vertical"
    end
  end

  #scatter
  class ScatterValue
    include OWJSON
    def initialize( x, y, dot_size=-1 )
      @x = x
      @y = y
      if( dot_size > 0 )
        @dot_size = dot_size
      end
    end
  end

  class Scatter
    include OWJSON
    def scatter( colour, dot_size )
      @type      = "scatter"
      set_colour( colour )
      set_dot_size( dot_size )
    end
  
    %w(colour dot_size values).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end

  
  class Graph
    include OWJSON
    attr_accessor :title, :x_axis, :y_axis, :y_axis_right, :x_legend, :y_legend, :bg_colour 
    
    #    def set_title(title)
    #      @title = title
    #    end
    #    def set_x_axis(x)
    #      @x_axis = x
    #    end
    
    %w(title x_axis y_axis y_axis_right x_legend y_legend bg_colour).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
    #    %w(x_axis y_axis).each do |method| 
    #      define_method("add_#{method}") do |a|
    #        self.instance_variable_set("@#{method}", a)
    #      end
    #    end
    
    def initialize  
      @title = Title.new( "Graph" )
      @elements = []
    end

    def add_element( e )
      @elements << e
    end
    def render
      s = to_json
      s.gsub('__','-')
    end
  end


  # line chart
  class LineBase 
    include OWJSON
    
    def initialize(text = 'label text', font_size='10px', values = [9,6,7,9,5,7,6,9,7])
      @type      = "line_dot"
      @text      = text
      @font__size = font_size
      @values    = values
    end
    %w(values width colour font_size dot_size halo_size text).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  class LineDot < LineBase
  end
  class Line < LineBase
    def initialize
      super
      @type      = "line"
    end
  end
  class LineHollow < LineBase
    def initialize
      super
      @type      = "line_hollow"
    end
  end
  
  
  #area
  class AreaHollow
    def initialize(fill_alpha = 0.35, values = [])
      @type      = "area_hollow"
      @fill_alpha = fill_alpha
      @values    = values
    end
    %w(width color values dot_size text font_size).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  
  #bar
    
  class BarBase
    def initialize (values = [], text = '', size = '10px')
      @values = values
      @text = text
      @font_size = size
    end
    def set_key( text, size )
      @text = text
      @font_size = size
    end
    %w(alpha color values text font_size).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
    def append_value( v )
      @values << v		
    end
  end
  class Bar < BarBase
    def initialize()
      @type      = "bar"
    end
  end
  class Bar3dValue
    def set_top(top = nil, color = '', tip = nil)
      @top = top
      @color = color
      @tip = tip
    end	
    def set_top( top )
      @top = top
    end	
    def set_colour( colour )
      @colour = colour
    end
	
    def set_tooltip( tip )
      @tip = tip
    end
  end
  class Bar3d < BarBase
    def initialize()
      @type      = "bar_3d"
    end
  end
  
  class BarGlassValue < Bar3dValue
  end
  class BarGlass < BarBase
    def initialize()
      @type      = "bar_glass"
    end
  end

  
  class BarSketch < BarBase
    def bar_sketch( colour = '', outline_colour = '', fun_factor = '')
      @type      = "bar_sketch"
      set_colour( colour )
      set_outline_colour( outline_colour )
      @offset = fun_factor
    end
    %w(offset outline_color).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  class BarStack < BarBase
    def initialize
      @type      = "bar_stack"
    end
    def append_stack( v )
      append_value( v )
    end
  end
  class BarStackValue
    def initialize(val, colour)
      @val = val
      @colour = colour
    end
    %w(val color).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  
  class HbarValue
    def initialize( left, right )
      @left = left
      @right = right
    end
    %w(left right).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
  class Hbar
    def initialize
      @type      = "hbar"
      @colour    = "#9933CC"
      @text      = "Page views"
      @font_size = '10px'
      @values    = []
    end
    %w(colour text font_size values).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
    def append_value( v )
      @values << v		
    end
  end
  
  ########## pie
  class PieValue
    def initialize( value, text )
      @value = value
      @text = text
    end
  end

  class Pie
    def initialize
      @type      		= 'pie'
      @colours     		= ["#d01f3c","#356aa0","#C79810"]
      @alpha			= 0.6
      @border			= 2
      @values			= [2,3, PieValue.new(6.5, "hello (6.5)")]
    end
    %w(colours alpha border values animate start_angle).each do |method| 
      define_method("set_#{method}") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
      define_method("#{method}=") do |a|
        self.instance_variable_set("@#{method.gsub('_','__')}", a)
      end
    end
  end
end
