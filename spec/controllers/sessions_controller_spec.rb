require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
    context "with valid data" do
      it "redirects to the admin page" do
        admin = FactoryBot.create(:admin)
        
        post :create, params: { email: admin.email, password: admin.password }
        
        expect(session[:admin_id]).to eq(admin.id)
        expect(response).to redirect_to(admin_url)
      end
    end
    
    context "with invalid data" do
      it "redirects to the sign in page" do
        post :create, params: { email: "test@email.com", password: "password123" }
        
        expect(session[:admin_id]).to be_nil
        expect(response).to redirect_to(sign_in_url)
      end
    end
  end
  
  describe "DELETE #destroy" do    
    it "resets session" do
      admin = FactoryBot.build_stubbed(:admin)
      session[:admin_id] = admin.id
      
      delete :destroy
      
      expect(session[:admin_id]).to be_nil
    end
    
    it "redirects to the home page" do
      delete :destroy
      
      expect(response).to redirect_to(root_url)
    end
  end
end