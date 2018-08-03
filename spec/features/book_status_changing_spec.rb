require "rails_helper"

feature "Book status changing" do
  let(:admin) { FactoryBot.create(:admin) }
  let!(:book) { FactoryBot.create(:book, status: "in_process") }
  
  before { sign_in_as(admin) }
  
  scenario "successful status changing" do
    visit edit_book_path(book, locale: nil)
    select "completed"
    click_button "Update Book"
    
    book.reload
    
    expect(page.current_url).to eq(book_url(book, locale: nil))
    expect(book.status).to eq("completed")
    expect(page).to have_content("Book has been successfully updated")
  end
end