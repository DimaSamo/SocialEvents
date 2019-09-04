class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :location
  belongs_to :user, serializer: EventUserSerializer
  has_many :users, through: :rsvps, serializer: EventUsersSerializer
  has_many :rsvps

  # create_table "events", force: :cascade do |t|
  #   t.string "title"
  #   t.string "description"
  #   t.datetime "date"
  #   t.string "location"
  #   t.integer "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
end
