class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title, :null => false
      t.references :area, :null => false
      t.references :company, :null => false
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at
      t.integer :pv, :default => 0
      t.integer :rec_num, :default => 0
      t.integer :pop_num, :default => 0
      t.text :summary
      t.text :body
      t.timestamps
    end
    
    add_index :topics, :area_id
    add_index :topics, :company_id
  end

  def self.down
    drop_table :topics
  end
end
