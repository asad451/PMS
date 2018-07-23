class ClientsController < ApplicationController

  before_action :find_client, only: [:edit, :update, :destroy]
  before_action :authenticate_role, only: [:new, :edit]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def edit
    render 'edit'
  end

  def update
    if @client.update(client_params)
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to admin_root_path
  end

  private

    def find_client
      @client = Client.find(params[:id])
    end

  def client_params
    params.require(:client).permit(:name, :email, :country)
  end

  def authenticate_role
    unless current_user.admin? || current_user.manager?
      return (redirect_to root_path, alert: 'You are not authorize to view this page')
    end
  end

end
