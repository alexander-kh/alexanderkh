require 'rails_helper'

RSpec.describe "books/index.html.erb" do
  context "when authorized" do
    it "displays action for adding a new book" do
      book = FactoryBot.create(:book)
      assign(:books, [book])
      allow(view).to receive(:signed_in?).and_return(true)
      
      render
      
      expect(rendered).to have_content(book.title)
      expect(rendered).to have_selector("a[href='#{new_book_path}']")
    end
  end
  
  context "without authorization" do
    it "does not display action for adding a new book" do
      book = FactoryBot.create(:book)
      assign(:books, [book])
      
      render
      
      expect(rendered).to have_content(book.title)
      expect(rendered).not_to have_selector("a[href='#{new_book_path}']")
    end
  end
end