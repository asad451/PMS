class ClientsController < ApplicationController

  before_action :find_client, only: [:show]

  def index
    @clients = Client.perform_search(params)
  end

  def show
  end

  private

    def find_client
      @client = Client.find(params[:id])
    end

end
