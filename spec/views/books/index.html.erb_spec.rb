require 'rails_helper'

RSpec.describe "books/index.html.erb" do
  context "when authorized" do
    it "displays actions for adding, editing and deleting books" do
      book = FactoryBot.build_stubbed(:book)
      assign(:books, [book])
      allow(view).to receive(:signed_in?).and_return(true)
      
      render
      
      expect(rendered).to have_content(book.title)
      expect(rendered).to have_selector("a[href='#{new_book_path}']")
      expect(rendered).to have_selector("a[href='#{edit_book_path(book)}']")
      expect(rendered).to have_selector("a[data-method='delete'][href='#{book_path(book)}']")
    end
  end
  
  context "without authorization" do
    it "does not display actions for adding, editing and deleting books" do
      book = FactoryBot.build_stubbed(:book)
      assign(:books, [book])
      
      render
      
      expect(rendered).to have_content(book.title)
      expect(rendered).not_to have_selector("a[href='#{new_book_path}']")
      expect(rendered).not_to have_selector("a[href='#{edit_book_path(book)}']")
      expect(rendered).not_to have_selector("a[data-method='delete'][href='#{book_path(book)}']")
    end
  end
end