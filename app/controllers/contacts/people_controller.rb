module Contacts
  class PeopleController < AuthenticatedController
    responders :flash, :collection

    before_action :set_person, only: [:show, :edit, :update, :destroy]

    def index
      @people = current_user.contacts_people.order(:first_name)
      respond_with @people
    end

    def show
      respond_with @person
    end

    def new
      @person = current_user.contacts_people.new()
      respond_with @person
    end

    def create
      @person = current_user.contacts_people.create(person_params)
      respond_with @person
    end

    def edit
      respond_with @person
    end

    def update
      @person.update(person_params)
      respond_with(@person)
    end

    def destroy
      @person.destroy
      respond_with @person
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = current_user.contacts_people.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def person_params
        params.require(:contacts_person).permit(:first_name, :last_name, :email)
      end

  end
end