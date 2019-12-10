class AddAttachmentImageToSpaces < ActiveRecord::Migration[5.0]
  def self.up
    change_table :spaces do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spaces, :image
  end
end
