class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :kind
      t.string :priority
      t.integer :user_id
      t.integer :assigned_user
      t.integer :votesCount
      t.integer :watchers
      t.string :status

      t.timestamps
    end

  end
  
end
