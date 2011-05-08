class AddPrintedToLendings < ActiveRecord::Migration
  def self.up
    add_column :lendings, :printed, :boolean, :default => false
  end

  def self.down
    remove_column :lendings, :printed
  end
end
