class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :client
end
