class RsvpSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :event
  attributes :user_id, :note, :id
end
