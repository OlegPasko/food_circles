# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#News.create!(
#  title: 'title',
#  mobile_image: open("#{Rails.root}/app/assets/images/logo_old.png"),
#  website_image: open("#{Rails.root}/app/assets/images/logo_old.png")
#)
#News.create!(
#  title: 'title',
#  mobile_image: open("#{Rails.root}/app/assets/images/sellit.png"),
#  website_image: open("#{Rails.root}/app/assets/images/sellit.png")
#)
#News.create!(
#  title: 'title',
#  mobile_image: open("#{Rails.root}/app/assets/images/dinein.png"),
#  website_image: open("#{Rails.root}/app/assets/images/dinein.png")
#)
3.times do |n|
  arr = [
    "#{Rails.root}/app/assets/images/sellit.png",
    "#{Rails.root}/app/assets/images/dinein.png",
    "#{Rails.root}/app/assets/images/logo_old.png"
  ]
  News.create!(
    title: 'title',
    mobile_image: open(arr[(n + 1) - 1]),
    website_image: open(arr[(n + 1) - 1])
  )
end
