class AddNumberToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :number, :integer, :default => 0, :after => :slug
  end

  def self.down
    remove_column :areas, :number
  end
end
