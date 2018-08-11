class Admin::PaymentsController < Admin::BaseController

  before_action :find_project, only: [:new, :create, :destroy]
  before_action :find_payment, only: [:edit, :update, :destroy]

  def new
    @payment = @project.payments.new
  end

  def create
    @payment = @project.payments.new(payment_params)
    if @payment.save
      redirect_to admin_project_path(@project), notice: "Payment created successfully!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      redirect_to admin_project_path(@payment.project), notice: "Payment updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @payment.destroy
    redirect_to admin_project_path(@project), notice: "Payment deleted successfully!"
  end

  private

    def payment_params
      params.require(:payment).permit(:amount)
    end

    def find_payment
      @payment = Payment.find(params[:id])
    end

    def find_project
      @project = Project.find(params[:project_id])
    end

end
