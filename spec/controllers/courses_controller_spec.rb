require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
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
    let(:course_attrs) { FactoryBot.attributes_for(:course) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        expect { post :create, params: { course: course_attrs } }.
          not_to change(Course, :count)
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      context "when attributes are valid" do
        it "creates new course and redirects to the courses page" do
          expect { post :create, params: { course: course_attrs } }.
            to change(Course, :count).by(1)
          expect(response).to have_http_status(:found)
        end
      end
      
      context "when attributes are not valid" do
        it "re-renders template" do
          attrs = FactoryBot.attributes_for(:course, platform: nil)
          
          expect { post :create, params: { course: attrs } }.
            not_to change(Course, :count)
          expect(response).to render_template(:new)
        end
      end
    end
  end
  
  describe "GET #show" do
    let(:course) { FactoryBot.create(:course) }
    
    context "whithout authorization" do
      it "redirects to the sign in page" do
        get :show, params: { id: course.id }
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :show, params: { id: course.id }
        
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "GET #edit" do
    let(:course) { FactoryBot.create(:course) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        get :edit, params: { id: course.id }
        
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "returns http success" do
        get :edit, params: { id: course.id }
        
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "PATCH #update" do
    let(:course) { FactoryBot.create(:course, platform: "edx") }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        patch :update, params: { id: course.id, course: { platform: "edX" } }
        course.reload
        
        expect(course.platform).to eq("edx")
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      context "when attributes are valid" do
        it "updates the course and redirects to the courses page" do
          patch :update, params: { id: course.id, course: { platform: "edX" } }
          course.reload
        
          expect(course.platform).to eq("edX")
          expect(response).to redirect_to(courses_url)
        end
      end
      
      context "when attributes are not valid" do
        it "re-renders template" do
          patch :update, params: { id: course.id, course: { platform: nil } }
          course.reload
          
          expect(course.platform).to eq(course.platform)
          expect(response).to render_template(:edit)
        end
      end
    end
  end
  
  describe "DELETE #destroy" do
    let!(:course) { FactoryBot.create(:course) }
    
    context "without authorization" do
      it "redirects to the sign in page" do
        expect { delete :destroy, params: { id: course.id } }.
          not_to change(Course, :count)
        expect(response).to redirect_to(sign_in_url)
      end
    end
    
    context "when authorized" do
      before { sign_in_as_admin }
      
      it "removes the course and redirects to the courses page" do
        expect { delete :destroy, params: { id: course.id } }.
          to change(Course, :count).by(-1)
        expect(response).to redirect_to(courses_url)
      end
    end
  end
end
