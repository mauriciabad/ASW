class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.string :text
      t.integer :comment_id

      t.timestamps
    end
  end
end
