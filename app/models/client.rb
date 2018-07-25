class Client < ApplicationRecord
  validates :name,:country, :email, presence: true
  has_many :projects
  paginates_per 5
end
