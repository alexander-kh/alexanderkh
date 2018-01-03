module ControllerHelpers
  def sign_in_as_admin
    allow(controller).to receive(:require_signing_in)
  end
end