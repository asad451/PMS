class Assignment < ApplicationRecord
  validates :role, presence: true, length: { in: 1..20 }
  belongs_to :user
  belongs_to :project
end
