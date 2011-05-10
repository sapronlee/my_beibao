class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :null => false
      t.string :auther, :null => false
      t.references :area, :null => false
      t.references :company, :null => false
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at
      t.integer :pv, :default => 0
      t.integer :status, :default => 0
      t.text :summary
      t.text :body
      t.timestamps
    end
    
    add_index :articles, :area_id
    add_index :articles, :company_id
  end

  def self.down
    drop_table :articles
  end
end
