class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client
  paginates_per 5

  def user_name
    self.client.name
  end
end
