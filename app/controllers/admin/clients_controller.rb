module Admin
  class ClientsController < AdminController

    def index
      @clients = Client.order(:short_name)
    end
  end
end