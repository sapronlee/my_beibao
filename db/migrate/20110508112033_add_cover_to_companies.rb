class AddCoverToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :cover_file_size, :integer, :after => :cover_file_name
    add_column :companies, :cover_content_type, :string, :after => :cover_file_size
    add_column :companies, :cover_updated_at, :datetime, :after => :cover_content_type
  end

  def self.down
    remove_column :companies, :cover_file_size
    remove_column :companies, :cover_content_type
    remove_column :companies, :cover_updated_at
  end
end
