class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :issue
  has_many :line
end
