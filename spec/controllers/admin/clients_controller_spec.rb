require 'rails_helper'

RSpec.describe Admin::ClientsController, type: :controller do

  context "with a logged in super_admin" do
    login_super_admin

    it "should have a current user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  context "with a logged in user (not super_admin)" do
    login_user

    it "should have a current user" do
      expect(subject.current_user).to_not eq(nil)
    end

  end

  context "without a logged in user" do
    it "should not have a current user" do
      expect(subject.current_user).to eq(nil)
    end
  end

end
