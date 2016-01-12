require 'rails_helper'

RSpec.describe Admin::AdminController, type: :controller do

  context "with a logged in super_admin" do
    login_super_admin

    it "should have a current user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "current user should be super_admin" do
      expect(subject.current_user.super_admin?).to eq(true)
    end
  end

  context "with a logged in user (not super_admin)" do
    login_user

    it "should have a current user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "current user should not be super_admin" do
      expect(subject.current_user.super_admin?).to eq(false)
    end
  end

  context "without a logged in user" do

    it "should not have a current user" do
      expect(subject.current_user).to eq(nil)
    end

  end

end