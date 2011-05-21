class AddAdToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :ad_file_name, :string
    add_column :areas, :ad_file_size, :integer
    add_column :areas, :ad_type_content, :string
    add_column :areas, :ad_updated_at, :datetime
  end

  def self.down
    remove_column :areas, :ad_file_name
    remove_column :areas, :ad_file_size
    remove_column :areas, :ad_type_content
    remove_column :areas, :ad_updated_at
  end
end
