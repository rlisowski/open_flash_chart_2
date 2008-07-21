class InfosController < ApplicationController
  def changes
    path = "#{RAILS_ROOT}/vendor/plugins/open_flash_chart_2/CHANGES"
    if File.exist?(path)
      @file = File.read( path ).gsub!("\n","\r")
    else
      @file = "file: #{path} does not exist!"
    end
    render :action => 'display_file'
  end
  def todo
    path = "#{RAILS_ROOT}/vendor/plugins/open_flash_chart_2/TODO"
    if File.exist?(path)
      @file = File.read( path ).gsub!("\n","\r")
    else
      @file = "file: #{path} does not exist!"
    end
    render :action => 'display_file'
  end
  def install
    path = "#{RAILS_ROOT}/public/code/"
    @files = {}
    ['install_plugin','install_sample_app'].each do |file|
      _path = path + file
      if File.exist?(_path)
        @files[file.to_sym] = File.read(_path).gsub!("\n","\r")
      else
        @files[file.to_sym] = "file: #{_path} does not exist!"
      end
    end
  end
end
