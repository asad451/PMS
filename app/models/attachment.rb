class Attachment < ApplicationRecord
  validates :file, presence: true
  belongs_to :attachable, polymorphic: true
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: ["application/pdf", /\Aimage\/.*\z/]
end
