class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :products, :type, :category
  end

  def self.down
  end
end
