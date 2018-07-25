class Project < ApplicationRecord
  validates :title, :description, :price, :time, presence: true
  belongs_to :client

  def user_name
    self.client.name
  end

end
