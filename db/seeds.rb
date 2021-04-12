# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require "faker"

20.times do
    q = Question.new(
        content: Faker::Quote.famous_last_words,
        tag: "others",
    )
    q.save
end

# 20.times do
#     number = 80
#     q = Answer.new(
#         content: Faker::Quote.famous_last_words,
#         up_vote: 0,
#         down_vote: 0,
#         question_id: number
#     )
#     q.save
#     number += 1
# end


