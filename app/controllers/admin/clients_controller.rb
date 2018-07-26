class Admin::ClientsController < Admin::BaseController

  before_action :find_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.order(:name).page params[:page]
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path, notice: "Client created successfully!"
    else
      render 'new'
    end
  end

  def edit
    render 'edit'
  end

  def update
    if @client.update(client_params)
      redirect_to admin_clients_path, notice: "Client updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    if @client.projects.any?
      redirect_to admin_clients_path, alert: "Cannot delete Client! First You have to delete its projects"
    else
      @client.destroy
      redirect_to admin_clients_path, notice: "Client deleted successfully!"
    end
  end

  private

    def find_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :email, :country)
    end

end
