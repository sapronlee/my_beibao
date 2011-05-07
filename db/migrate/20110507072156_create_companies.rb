class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :null => false
      t.string :tel, :null => false
      t.string :qq
      t.string :msn
      t.string :address, :null => false
      t.string :linkman, :null => false
      t.string :summary
      t.string :body, :null => false
      t.string :cover_file_name
      t.string :web_site
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
