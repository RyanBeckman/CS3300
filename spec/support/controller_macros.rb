require 'spec_helper'

module ControllerMacros
    def login_admin
        # Before each test, create and login the admin
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:admin]
            sign_in FactoryBot.create(:admin)
        end
    end
  
end