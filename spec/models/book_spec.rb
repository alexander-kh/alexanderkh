require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "default scope" do
    let(:books) { FactoryBot.create_list(:book, 4) }
    
    it "returns books by creation date in descending order" do
      expect(Book.all).to eq([books[3], books[2], books[1], books[0]])
    end
  end
  
  describe "validations" do
    let(:book) { FactoryBot.build(:book) }
      
    it "is valid with valid attributes" do
      expect(book).to be_valid
    end
  
    describe "#title" do
      it "is required" do
        book.title = nil
        book.valid?
      
        expect(book.errors[:title].size).to eq(1)
      end
    
      it "is unique" do
        book.save
        another_book = FactoryBot.build(:book, title: book.title)
        another_book.valid?
      
        expect(another_book.errors[:title].size).to eq(1)
      end
    end
  end
end