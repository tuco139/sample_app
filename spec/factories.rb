# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name                  "Doodle Bug"
  user.email                 "db@cornell.edu"
  user.password              "foobar"
  user.password_confirmation "foobar"
end