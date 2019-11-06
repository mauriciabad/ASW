class Watch < ApplicationRecord
  belongs_to :issue
  belongs_to :user, on_delete: :cascade
end
