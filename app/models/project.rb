class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client
  has_many :payments
  has_many :comments, as: :commentable
  has_many :assignments
  has_many :users, through: :assignments

  has_many :time_logs
  has_many :time_log_users, class_name: "User", foreign_key: "user_id", through: :time_logs

  paginates_per 5

  def user_name
    self.client.name
  end
end
