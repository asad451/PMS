class Payment < ApplicationRecord
  validates :amount, presence: true
  belongs_to :project

  scope :project_payments_of_current_month, -> {
    joins(:project).group(:project_id).
    where('payments.created_at >= ? AND payments.created_at <= ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month).
    sum('amount')
  }

end
