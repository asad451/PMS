class Client < ApplicationRecord

  after_save :set_project_delta_flag
  after_destroy :set_project_delta_flag

  validates :name,:country, :email, presence: true
  has_many :projects, dependent: :destroy
  paginates_per 5

  def self.perform_search(params={})
    self.search params[:search], { page: params[:page], per_page: 5 }
  end

  private

    def set_project_delta_flag
      projects.update delta: true
    end

end
