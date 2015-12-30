module Admin
  class AdminController < AuthenticatedController
    before_action :verify_super_admin

    private
      def verify_super_admin
        redirect_to :back, alert: "Unauthorized access." unless current_user.try(:super_admin?)
      end

  end
end