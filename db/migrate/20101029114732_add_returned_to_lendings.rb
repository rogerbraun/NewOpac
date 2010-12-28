class AddReturnedToLendings < ActiveRecord::Migration
  def self.up
    add_column :lendings, :returned, :boolean
  end

  def self.down
    remove_column :lendings, :returned
  end
end
