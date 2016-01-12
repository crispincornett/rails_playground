module ControllerMacros
  def login_super_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:super_admin]
      super_admin = FactoryGirl.create(:super_admin)
      super_admin.confirm
      # sign_in :user, super_admin # sign_in(scope, resource)
      sign_in super_admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end
