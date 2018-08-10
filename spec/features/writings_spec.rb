require "rails_helper"

feature "writings" do
  let(:admin) { FactoryBot.create(:admin) }
  let!(:personal_writing) { FactoryBot.create(:writing,
    title: "Personal writing", status: "personal") }
  
  context "when authorized" do
    before { sign_in_as(admin) }
    
    scenario "adding a new writing" do
      visit writings_path
    
      click_link "Add a writing"
    
      fill_in "writing_title", with: "Title"
      fill_in "writing_content", with: "Content"
      choose "writing_status_personal"
    
      click_button "Create Writing"
    
      expect(page).to have_content("Writing has been successfully created")
      expect(page.current_url).to eq(writings_url)
      expect(page).to have_content("Content")
    end
  
    scenario "adding a writing without title" do
      visit writings_path
    
      click_link "Add a writing"
    
      fill_in "writing_title", with: ""
      fill_in "writing_content", with: "Content"
      choose "writing_status_open"
    
      click_button("Create Writing")
    
      expect(page.current_url).to eq(new_writing_url)
    end
  
    scenario "viewing personal writings" do
      visit writings_path
      
      expect(page).to have_content("Personal writing")
    end
    
    scenario "updating the writing" do
      visit writing_path(personal_writing)
    
      click_link "edit_writing_#{personal_writing.id}"
    
      updated_content = "Updated content for the writing #{personal_writing.id}"
      fill_in "writing_content", with: updated_content
    
      click_button "Update Writing"
    
      expect(page).to have_content("Writing has been successfully updated")
      expect(page.current_url).to eq(writing_url(personal_writing))
      expect(page).to have_content(updated_content)
    end
  
    scenario "updating the writing with blank title" do
      visit edit_writing_path(personal_writing)
    
      fill_in "writing_title", with: ""
    
      click_button "Update Writing"
    
      expect(page.current_url).to eq(edit_writing_url(personal_writing))
    end
    
    scenario "removing the writing" do
      visit edit_writing_path(personal_writing)
      
      click_link "Remove"
      
      expect(page).to have_content("Writing has been successfully removed")
      expect(page.current_url).to eq(writings_url)
    end
  end
  
  context "when not authorized" do
    scenario "viewing personal writings" do
      visit writings_path
    
      expect(page).not_to have_content("Personal writing")
    end
  end
end