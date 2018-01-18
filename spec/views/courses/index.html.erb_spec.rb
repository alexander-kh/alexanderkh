require 'rails_helper'

RSpec.describe "courses/index.html.erb" do
  context "when authorized" do
    it "displays action for adding a new course" do
      course = FactoryBot.create(:course)
      assign(:courses, [course])
      allow(view).to receive(:signed_in?).and_return(true)
      
      render
      
      expect(rendered).to have_content(course.title)
      expect(rendered).to have_selector("a[href='#{new_course_path}']")
    end
  end
  
  context "without authorization" do
    it "does not display action for adding a new course" do
      course = FactoryBot.create(:course)
      assign(:courses, [course])
      
      render
      
      expect(rendered).to have_content(course.title)
      expect(rendered).not_to have_selector("a[href='#{new_course_path}']")
    end
  end
end