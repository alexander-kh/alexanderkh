require "rails_helper"

feature "notes" do
  let(:admin) { FactoryBot.create(:admin) }
  let!(:book) { FactoryBot.create(:book) }
  let!(:course) { FactoryBot.create(:course) }
  let!(:book_note) { FactoryBot.create(:note, resource: book) }
  let!(:course_note) { FactoryBot.create(:note, resource: course) }
  
  before do
    sign_in_as(admin)
  end
  
  scenario "adding a note to the book" do    
    visit book_path(book)
    click_link "Add a note"
    
    expect(page.current_url).to eq(new_book_note_url(book))
    
    fill_in "note_text", with: "Book's first note"
    click_button "Create Note"
    
    expect(page).to have_content("Note has been successfully created")
    expect(page.current_url).to eq(book_url(book))
    expect(page).to have_content("Book's first note")
  end
  
  scenario "adding note to the course" do
    visit course_path(course)
    click_link "Add a note"
    
    expect(page.current_url).to eq(new_course_note_url(course))
    
    fill_in "note_text", with: "Course's first note"
    click_button "Create Note"
    
    expect(page).to have_content("Note has been successfully created")
    expect(page.current_url).to eq(course_url(course))
    expect(page).to have_content("Course's first note")
  end
  
  scenario "updating the book's note" do
    visit book_path(book)
    
    click_link "edit_note_#{book_note.id}"
    
    expect(page.current_url).to eq(edit_book_note_url(book, book_note))
    
    fill_in "note_text", with: "Updated note"
    click_button "Update Note"
    
    expect(page).to have_content("Note has been successfully updated")
    expect(page.current_url).to eq(book_url(book))
    expect(page).to have_content("Updated note")
  end
    
  scenario "updating the course's note" do
    visit course_path(course)
    
    click_link "edit_note_#{course_note.id}"
    
    expect(page.current_url).to eq(edit_course_note_url(course, course_note))
    
    fill_in "note_text", with: "Updated note"
    click_button "Update Note"
    
    expect(page).to have_content("Note has been successfully updated")
    expect(page.current_url).to eq(course_url(course))
    expect(page).to have_content("Updated note")
  end
  
  scenario "saving a blank note" do
    visit book_path(book)
    
    click_link "edit_note_#{book_note.id}"
    
    fill_in "note_text", with: ""
    click_button "Update Note"
    
    expect(page.current_url).to eq(edit_book_note_url(book, book_note))
  end
  
  scenario "removing a note" do
    visit book_path(book)
    
    click_link "edit_note_#{book_note.id}"
    
    expect(page.current_url).to eq(edit_book_note_url(book, book_note))
    
    click_link "Remove"
    
    expect(page).to have_content("Note has been successfully removed")
    expect(page.current_url).to eq(book_url(book))
  end
end