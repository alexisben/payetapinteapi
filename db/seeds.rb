# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
admin = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << admin.name
admin.add_role :admin

barmaster = User.find_or_create_by_email :name => ENV['BARMASTER_NAME'].dup, :email => ENV['BARMASTER_EMAIL'].dup, :password => ENV['BARMASTER_PASSWORD'].dup, :password_confirmation => ENV['BARMASTER_PASSWORD'].dup
puts 'user: ' << barmaster.name
barmaster.add_role :barmaster


pintemaster = User.find_or_create_by_email :name => ENV['PINTEMASTER_NAME'].dup, :email => ENV['PINTEMASTER_EMAIL'].dup, :password => ENV['PINTEMASTER_PASSWORD'].dup, :password_confirmation => ENV['PINTEMASTER_PASSWORD'].dup
puts 'user: ' << pintemaster.name
pintemaster.add_role :pintemaster


guest = User.find_or_create_by_email :name => ENV['GUEST_NAME'].dup, :email => ENV['GUEST_EMAIL'].dup, :password => ENV['GUEST_PASSWORD'].dup, :password_confirmation => ENV['GUEST_PASSWORD'].dup
puts 'user: ' << guest.name
guest.add_role :guest
