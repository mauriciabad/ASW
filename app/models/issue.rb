class Issue < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :watches, dependent: :destroy
end
