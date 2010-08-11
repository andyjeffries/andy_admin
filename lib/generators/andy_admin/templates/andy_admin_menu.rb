require 'andy_admin/menu'
require 'andy_admin/form_builder'

ANDY_ADMIN_MENU = AndyAdmin::Menu.build do
  main :test1, "Test 1", '/'
  main :test2, "Test 2", '#'
  main :test3, "Test 3", "/"
  sub :test4, "Test 4 S"
  sub :logout, "Logout"
end