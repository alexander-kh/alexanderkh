require 'rails_helper'

feature 'locale switching' do
  context 'when the requested locale present' do
    scenario 'locale switching from English to Russian' do
      visit root_url
      click_link "Russian"
      
      expect(current_url).to eq(root_url(locale: 'ru'))
    end
  end
  
  context 'when the requested locale does not present' do
    scenario 'locale switching from English to Portuguese' do
      visit root_url(locale: 'pt')
      
      expect(current_url).to eq(root_url)
    end
  end
end