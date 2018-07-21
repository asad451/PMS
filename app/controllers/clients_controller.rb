class ClientsController < ApplicationController

  before_action :find_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    if user_signed_in?
      if current_user.admin? || current_user.manager?
        @client = Client.new
      else
        redirect_to root_path, alert: 'You are not authorize to view this page'
      end
    else
      redirect_to new_user_session_path, alert: 'You need to login first'
    end
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
    if user_signed_in?
      if current_user.admin? || current_user.manager?
        render 'edit'
      else
        redirect_to root_path, alert: 'You are not authorize to view this page'
      end
    else
      redirect_to new_user_session_path, alert: 'You need to login first'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def show
    redirect_to admin_root_path
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

end
