# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec 
tristique diam quis aliquam imperdiet. Maecenas in metus non erat fermentum
accumsan. Nullam et viverra nisi, a congue nisi. Vestibulum vel nisl ut quam
luctus varius. Curabitur scelerisque tortor nunc, id posuere nunc viverra
eget. Pellentesque sagittis porttitor mattis. Nullam aliquet laoreet luctus.
Maecenas porttitor tristique cursus. Maecenas tincidunt neque et lectus
bibendum, ut tincidunt ligula tempus. Donec id arcu fringilla, interdum dui
a, tincidunt velit. Morbi quis felis id eros tempus lacinia et sed massa.
Quisque dapibus tempor mauris pellentesque placerat."



User.create(
  email: 'admin@art.com',
  admin: true,
  full_name: 'Admin',
  password: "password",
  password_confirmation: "password")

User.create(
  email: 'John@art.com',
  admin: false,
  full_name: 'John Doe',
  bio: ipsum,
  password: "password",
  password_confirmation: "password",
  avatar: File.new("/home/zak/Pictures/high-quality-photo.jpg"))

a = Album.create(
  title: 'John\'s Best Work',
  description: ipsum,
  priority: 1,
  user_id: 2 )

b = Album.create(
  title: 'John\'s Worst Work',
  description: ipsum,
  priority: 2,
  user_id: 2  )

(1..6).each do |i|
  Piece.create(title: 'Goop', description: ipsum, album: b, priority: i, image: File.new("/home/zak/Pictures/high-quality-photo.jpg"))
end


(1..8).each do |i|
  Piece.create(title: 'Goop', description: ipsum, album: a, priority: i, image: File.new("/home/zak/Pictures/high-quality-photo.jpg"))
end
