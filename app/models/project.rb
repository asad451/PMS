class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client
  has_many :payments, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: proc { |attributes| attributes['attachment'].blank? }

  has_many :time_logs
  has_many :time_log_users, class_name: "User", foreign_key: "user_id", through: :time_logs
  paginates_per 5

  def self.perform_search(params={})
    if params[:no_pagination] == true
      self.search params[:search], { sql: { include: [:client] } }
    else
      self.search params[:search], { page: params[:page], sql: { include: [:client] }, per_page: 5 }
    end
  end

  def user_name
    self.client.name
  end
end
