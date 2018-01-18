require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe "GET #index" do    
    context "without authorization" do
      it "redirects to the sign in page" do
        get :index
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :index
        
        expect(response).to have_http_status(:success)
      end
    end
  end
end