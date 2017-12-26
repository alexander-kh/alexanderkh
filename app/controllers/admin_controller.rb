class AdminController < ApplicationController
  before_action :require_signing_in
  
  def index
  end
end
