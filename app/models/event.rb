# create_table "events", force: :cascade do |t|
#     t.string "title"
#     t.string "description"
#     t.datetime "date"
#     t.string "location"
#     t.integer "user_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

class Event < ApplicationRecord
    belongs_to :user
    has_many :rsvps, dependent: :destroy
    has_many :users, through: :rsvps
    scope :upcoming, -> {where("date > ?", Time.zone.now)}
    # Ex:- scope :active, -> {where(:active => true)}

    def self.ten_closest
        Event.upcoming.order(date: :asc).limit(10)
    end

end
