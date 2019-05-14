class CreateAttachedFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :attached_files do |t|
      t.belongs_to :issue, index: true

      t.timestamps
    end
  end
end
