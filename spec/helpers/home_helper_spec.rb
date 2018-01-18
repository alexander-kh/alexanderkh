require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe "#latest_added_books" do
    let(:books) { FactoryBot.build_stubbed_list(:book, 5) }
    
    it "returns the latest 2 added books" do
      allow(Book).to receive(:all).and_return(books)
      
      result = helper.latest_added_books(2)
      
      expect(result).to contain_exactly(books[0], books[1])
    end
  end
end
