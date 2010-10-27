class RenameSvbToIsbnInBuch < ActiveRecord::Migration
  def self.up
    rename_column :buches, :svb, :isbn
  end

  def self.down
    rename_column :buches, :isbn, :svb
  end
end
