class AndyAdminGenerator < Rails::Generator::Base
  attr_accessor :admin_name
  
  def initialize(runtime_args, runtime_options = {})
    super
    @admin_name = @args[0] || 'Your Site'
  end
  
  def manifest
    record do |m|
      m.template "admin.html.erb", "app/views/layouts/admin.html.erb"
      m.file "admin.css", "public/stylesheets/admin.css"
      m.file "alert-overlay.png", "public/images/admin-alert-overlay.png"
      m.file "admin.js", "public/javascripts/admin.js"
      m.template "login.html.erb", "app/views/layouts/login.html.erb"
      m.file "login.css", "public/stylesheets/login.css"
      m.file "login.js", "public/javascripts/login.js"
    end
  end
end