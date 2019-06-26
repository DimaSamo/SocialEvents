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
end
