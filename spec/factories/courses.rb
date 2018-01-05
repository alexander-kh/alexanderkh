FactoryBot.define do
  factory :course do
    sequence :title do |n|
      "title#{n}"
    end
    link "http://course.test"
    platform "platform"
  end
end
