class AddLoginToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :login, :string, :after => :id
  end

  def self.down
    remove_column :admins, :login
  end
end
