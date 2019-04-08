class Watchers < ActiveRecord::Migration[5.1]
  def change
    create_table :whatchers do |t|
      t.integer :id_issue
      t.string :watcher

      t.timestamps
    end
  end
end
