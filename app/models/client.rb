class Client < ApplicationRecord
  validates :name,:country, :email, presence: true
  has_many :projects
end
