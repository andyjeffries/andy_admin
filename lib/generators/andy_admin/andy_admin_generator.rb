require 'rails/generators'

class AndyAdminGenerator < Rails::Generators::Base
  argument :name, :type => :string, :banner => "name of your site", :default => "Your Site"
  argument :hue, :type => :numeric, :banner => "colour hue, 0-359", :default => 92
  
  source_root File.expand_path("templates", File.dirname(__FILE__))
  
  def copy_files
    template 'admin.html.erb', "app/views/layouts/admin.html.erb"
    template "admin.css", "public/stylesheets/admin.css"
    copy_file "alert-overlay.png", "public/images/admin-alert-overlay.png"
    copy_file "admin.js", "public/javascripts/admin.js"
    template "login.html.erb", "app/views/layouts/login.html.erb"
    template "login.css", "public/stylesheets/login.css"
    copy_file "login.js", "public/javascripts/login.js"
    copy_file "andy_admin_menu.rb", "config/initializers/andy_admin_menu.rb"
    copy_file "andy_admin_helper.rb", "app/helpers/andy_admin_helper.rb"
    # copy_file "lib/andy_admin"
    copy_file "menu.rb", "lib/andy_admin/menu.rb"
    copy_file "form_builder.rb", "lib/andy_admin/form_builder.rb"
  end
  
  private

  def dark_colour
    hsvToRGB(hue, 0.83, 0.35)
  end
  
  def light_colour
    hsvToRGB(hue, 0.79, 0.50)
  end
  
  def highlight_colour
    hsvToRGB(hue, 0.06, 0.99)
  end

  def rgbToHex(rgb)
    "#%02x%02x%02x" % [(rgb[0] * 255), (rgb[1] * 255), (rgb[2] * 255)]
  end
  
  def hsvToRGB(h, s, v)
    hi = (h/60.0).floor % 6
    f = h/60.0 - (h/60.0).floor
    p = v * (1 - s)
    q = v * (1 - f * s)
    t = v * (1 - (1 - f) * s)
    @rgb = []
    case hi
    when 0
      rgb = [v, t, p]
    when 1
      rgb = [q, v, p]
    when 2
      rgb = [p, v, t]
    when 3
      rgb = [p, q, v]
    when 4
      rgb = [t, p, v]
    when 5
      rgb = [v, p, t]
    end
    return rgbToHex(rgb)
  end
end