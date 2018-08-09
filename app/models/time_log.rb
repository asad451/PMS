class TimeLog < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :project_id, presence: true
  validate :check_time

  scope :project_timelogs_of_current_month, -> {
    joins(:project).group(:project_id).
    where('time_logs.created_at >= ? AND time_logs.created_at <= ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month).
    sum("(time_logs.end_time - time_logs.start_time) / 10000")
  }

  def check_time
    errors.add(:base, "End time should be greater than start") if self.end_time <= self.start_time
  end

end
