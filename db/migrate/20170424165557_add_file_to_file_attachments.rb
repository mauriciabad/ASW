class AddFileToFileAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attached_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :attached_files, :file
  end
end
