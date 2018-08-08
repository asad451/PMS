class ChartsController < ApplicationController

  def project_payments_by_month
    render json: Payment.project_payments_of_current_month
  end

end
