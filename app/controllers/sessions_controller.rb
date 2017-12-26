class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin.try(:authenticate, params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_url
    else
      redirect_to sign_in_url, alert: "Invalid e-mail or password"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Signed out"
  end
end
