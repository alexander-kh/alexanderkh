FactoryBot.define do
  factory :book do
    sequence :title do |n|
      "book#{n}"
    end
    subtitle "subtitle"
    author "author"
    link "http://book.test"
    year 2017
    publisher "publisher"
    isbn "isbn"
    pages 375
  end
end
