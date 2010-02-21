class AndyAdminGenerator < Rails::Generator::Base
  attr_accessor :admin_name, :dark_colour, :light_colour, :highlight_colour, :hue
  
  def initialize(runtime_args, runtime_options = {})
    super
    @admin_name = @args[0] || 'Your Site'
    @hue = @args[1].to_i || 92
    @dark_colour = hsvToRGB(@hue, 0.83, 0.35)
    @light_colour = hsvToRGB(@hue, 0.79, 0.50)
    @highlight_colour = hsvToRGB(@hue, 0.06, 0.99)
  end
  
  def manifest
    record do |m|
      m.template "admin.html.erb", "app/views/layouts/admin.html.erb"
      m.template "admin.css", "public/stylesheets/admin.css"
      m.file "alert-overlay.png", "public/images/admin-alert-overlay.png"
      m.file "admin.js", "public/javascripts/admin.js"
      m.template "login.html.erb", "app/views/layouts/login.html.erb"
      m.template "login.css", "public/stylesheets/login.css"
      m.file "login.js", "public/javascripts/login.js"
      m.file "andy_admin_menu.rb", "config/initializers/andy_admin_menu.rb"
      m.file "andy_admin_helper.rb", "app/helpers/andy_admin_menu.rb"
      m.directory "lib/andy_admin"
      m.file "menu.rb", "lib/andy_admin/menu.rb"
      m.file "form_builder.rb", "lib/andy_admin/form_builder.rb"
    end
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