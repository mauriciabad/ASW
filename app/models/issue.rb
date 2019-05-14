class Issue < ApplicationRecord
  belongs_to :user
  # belongs_to :assigned_user, :class_name => "User", foreign_key: "user_id"
  has_many :comment, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :watches, dependent: :destroy
  has_one_attached :attached_file
end
