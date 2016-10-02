# README

Rails 5.0.0
Ruby 2.3.1


## About

An art gallery that allows artists to log in and display artwork

The Database is initialized empty, to create an admin user in the console:

`User.create!({:email => "admin@art.com", :admin => true, :full_name => 'Admin', :password => "password", :password_confirmation => "password" })`


## To Do

- deploy

## Later

- Implement the contact artist buttons(mailer) - setup the mailer server settings once hosted
- paginate the messages
- test account type things - reset password and so on.. (check formatting)

- fix widths of the flash messages / colors / make the flash messages fade
- fix styling on the form pages
- custom color the nav bar

- redo the ordering system so make it easier to use
- stop viewers from downloading images
- fill in the Home and About pages with content
- add the number of messages to the dashboard
- get a new font
- fix the form input field formatting
