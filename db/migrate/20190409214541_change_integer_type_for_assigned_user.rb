class ChangeIntegerTypeForAssignedUser < ActiveRecord::Migration[5.2]
  def change
    change_column :issues , :assigned_user, :integer
  end
end
