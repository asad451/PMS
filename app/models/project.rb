class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client
  has_many :payments
  has_many :comments, as: :commentable
  has_many :assignments
  has_many :users, through: :assignments

  paginates_per 5

  def user_name
    self.client.name
  end
end
