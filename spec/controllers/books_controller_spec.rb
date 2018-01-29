require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "GET #new" do
    context "without authorization" do
      it "redirects to the sign in page" do
        get :new
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :new
        
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "POST #create" do
    let(:book_attrs) { FactoryBot.attributes_for(:book) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        expect { post :create, params: { book: book_attrs } }.
          not_to change(Book, :count)
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      context "when attributes are valid" do
        it "creates new book and redirects to the books page" do
          expect { post :create, params: { book: book_attrs } }.
            to change(Book, :count).by(1)
          expect(response).to redirect_to(books_url)
        end
      end
      
      context "when attributes are not valid" do
        it "re-renders template" do
          attrs = FactoryBot.attributes_for(:book, year: nil)
          
          expect { post :create, params: { book: attrs } }.
            not_to change(Book, :count)
          expect(response).to render_template :new
        end
      end
    end
  end
  
  describe "GET #show" do
    let(:book) { FactoryBot.create(:book) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        get :show, params: { id: book.id }
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :show, params: { id: book.id }
        
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "GET #edit" do
    let(:book) { FactoryBot.create(:book) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        get :edit, params: { id: book.id }
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :edit, params: { id: book.id }
        
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "PATCH #update" do
    let(:book) { FactoryBot.create(:book, pages: 375) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        patch :update, params: { id: book.id, book: { pages: 380 } }
        book.reload
        
        expect(book.pages).to eq(375)
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      context "when attributes are valid" do
        it "updates the book and redirects to the books page" do
          patch :update, params: { id: book.id, book: { pages: 380 } }
          book.reload
        
          expect(book.pages).to eq(380)
          expect(response).to redirect_to(books_url)
        end
      end
      
      context "when attributes are not valid" do
        it "re-renders template" do
          patch :update, params: { id: book.id, book: { year: nil } }
          book.reload
          
          expect(book.year).to eq(book.year)
          expect(response).to render_template(:edit)
        end
      end
    end
  end
  
  describe "DELETE #destroy" do
    let!(:book) { FactoryBot.create(:book) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        expect { delete :destroy, params: { id: book.id } }.
          not_to change(Book, :count)
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "removes the book and redirects to the books page" do
        expect { delete :destroy, params: { id: book.id } }.
          to change(Book, :count).by(-1)
        expect(response).to redirect_to(books_url)
      end
    end
  end
end
