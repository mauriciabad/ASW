class Line < ApplicationRecord
  belongs_to :comment, on_delete: :cascade
end
