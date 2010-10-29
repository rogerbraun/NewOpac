class AddAssociationsToLendings < ActiveRecord::Migration
  def self.up
    add_column :lendings, :entleiher_id, :integer
    add_column :lendings, :buch_id, :integer
  end

  def self.down
    remove_column :lendings, :entleiher_id
    remove_column :lendings, :buch_id
  end
end
