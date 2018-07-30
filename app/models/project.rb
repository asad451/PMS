class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client
  has_many :payments
  has_many :comments, as: :commentable
  paginates_per 5

  def user_name
    self.client.name
  end
end
