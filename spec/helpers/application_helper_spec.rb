require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#signed_in?" do
    context "when authorized" do
      
      it "returns true" do
        admin = FactoryBot.build_stubbed(:admin)
        session[:admin_id] = admin.id
        
        result = helper.signed_in?
        
        expect(result).to eq(true)
      end
    end
    
    context "without authorization" do
      it "returns false" do
        result = helper.signed_in?
        
        expect(result).to eq(false)
      end
    end
  end
end