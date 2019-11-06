class Vote < ApplicationRecord
  belongs_to :issue, on_delete: :cascade
  belongs_to :user, on_delete: :cascade
end
