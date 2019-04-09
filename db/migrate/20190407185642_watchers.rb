class Watchers < ActiveRecord::Migration[5.1]
  def change
    create_table :watchers do |t|
      t.references :issue, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end