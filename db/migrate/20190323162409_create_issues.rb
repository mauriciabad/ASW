class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :kind
      t.string :priority
      t.integer :user_id

      t.timestamps
    end
  end
end
