class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :title, :null => false
      t.references :area, :null => false
      t.references :company, :null => false
      t.text :rec, :null => false
      t.text :stroke, :null => false
      t.text :indemnify
      t.text :notice
      t.string :city
      t.string :start_date
      t.integer :nop, :default => 0
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :cover_file_size
      t.datetime :cover_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
