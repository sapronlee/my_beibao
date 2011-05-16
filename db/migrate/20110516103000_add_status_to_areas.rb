class AddStatusToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :status_cd, :integer, :default => 0, :after => :description
  end

  def self.down
    remove_column :areas, :status_cd
  end
end
