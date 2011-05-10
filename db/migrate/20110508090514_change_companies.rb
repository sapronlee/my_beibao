class ChangeCompanies < ActiveRecord::Migration
  def self.up
    change_column :companies, :summary, :text
    change_column :companies, :body, :text, :null => false
  end

  def self.down
    change_column :companies, :summary, :string
    change_column :companies, :body, :string, :null => false
  end
end
