require 'rails_helper'

RSpec.describe Culture::BooksController, type: :controller do

  context "with a logged in user" do
    login_user

    describe "GET #index" do
      it "renders the :index view" do
        get :index
        expect(response).to render_template(:index)
      end

      it "assigns @books" do
        book = create(:book, user: subject.current_user)
        get :index
        expect(assigns(:books)).to eq([book])
      end
    end
  end

  context "without a user" do
    describe "GET #index" do
      it "redirects to the sign in path" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

    end
  end

end
