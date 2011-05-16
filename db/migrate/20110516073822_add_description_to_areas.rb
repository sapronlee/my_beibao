class AddDescriptionToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :description, :string, :limit => 100, :after => :number
  end

  def self.down
    remove_column :areas, :description
  end
end
