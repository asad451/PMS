class User < ApplicationRecord
  enum role: [:user, :manager, :admin]
  enum status: [:disable, :enable]

  has_many :comments, as: :commentable
  has_many :assignments
  has_many :projects, through: :assignments
  has_many :user_provider, dependent: :destroy

  has_many :time_logs
  has_many :time_log_projects, class_name: "Project", foreign_key: "project_id", through: :time_logs

  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  paginates_per 5

  scope :enable_without_admin, -> { where(status: 'enable').where.not(role: 'admin').pluck(:username, :id) }

  def active_for_authentication?
    super && enable?
  end

  def inactive_message
    if enable?
      super
    else
      :not_approved
    end
  end

end
