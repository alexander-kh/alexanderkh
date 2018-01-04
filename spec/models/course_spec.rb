require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validations" do
    let(:course) { FactoryBot.build(:course) }
    
    it "is valid with valid attributes" do
      expect(course).to be_valid
    end
    
    describe "#title" do
      it "is required" do
        course.title = nil
        course.valid?
        
        expect(course.errors[:title].size).to eq(1)
      end
      
      it "is unique" do
        course.save
        another_course = FactoryBot.build(:course, title: course.title)
        another_course.valid?
        
        expect(another_course.errors[:title].size).to eq(1)
      end
    end
  end
end
