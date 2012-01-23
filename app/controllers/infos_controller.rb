class InfosController < ApplicationController
  def changes
    path = "#{Rails.root}/vendor/plugins/open_flash_chart_2/CHANGES"
    if File.exist?(path)
      @file =<<EOF
#{File.read( path )}
EOF
    else
      @file = "file: #{path} does not exist!"
    end
    render :action => 'display_file'
  end
  def todo
    path = "#{Rails.root}/vendor/plugins/open_flash_chart_2/TODO"
    if File.exist?(path)
      @file =<<EOF
#{File.read( path )}
EOF
    else
      @file = "file: #{path} does not exist!"
    end
    render :action => 'display_file'
  end
  def install
    path = "#{Rails.root}/public/code/"
    @files = {}
    ['install_plugin','install_sample_app', 'copy_files'].each do |file|
      _path = path + file
      if File.exist?(_path)
        @files[file.to_sym] =<<EOF
#{File.read(_path)}
EOF
      else
        @files[file.to_sym] = "file: #{_path} does not exist!"
      end
    end
  end
end
