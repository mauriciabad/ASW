class Comment < ApplicationRecord
  belongs_to :user, on_delete: :cascade
  belongs_to :issue, on_delete: :cascade
  has_many :line
end
