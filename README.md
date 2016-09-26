# README

Rails 5.0.0
Ruby 2.3.1


## About

An art gallery that allows artists to log in and display artwork

The Database is initialized empty, to create an admin user in the console:

`User.create!({:email => "admin@art.com", :admin => true, :full_name => 'Admin', :password => "password", :password_confirmation => "password" })`


## To Do

- fix the branching
- test account type things - reset password and so on.. (check formatting)
- add pos/neg flash messages
- deploy


## Later

- Implement the contact artist buttons(mailer) - setup the mailer server settings once hosted


- redo the ordering system so make it easier to use
- stop viewers from downloading images
- fill in the Home and About pages with content
- add the number of messages to the dashboard
- paginate the messages
- navigate through each picture directly without going back to the album page (maybe use a popup style window to display with arrows)
