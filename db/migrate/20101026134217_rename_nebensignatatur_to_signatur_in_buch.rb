class RenameNebensignataturToSignaturInBuch < ActiveRecord::Migration
  def self.up
    rename_column :buches, :nebensignatatur, :nebensignatur
  end

  def self.down
    rename_column :buches, :nebensignatur, :nebensignatatur
  end
end
