class TimeLog < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :project_id, presence: true
  validate :check_time

  def check_time
    errors.add(:base, "End time should be greater than start") if self.end_time <= self.start_time
  end

end
