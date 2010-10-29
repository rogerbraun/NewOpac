class CreateLendings < ActiveRecord::Migration
  def self.up
    create_table :lendings do |t|
      t.date :leihende

      t.timestamps
    end
  end

  def self.down
    drop_table :lendings
  end
end
