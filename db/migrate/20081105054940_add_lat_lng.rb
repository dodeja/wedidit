class AddLatLng < ActiveRecord::Migration
  def self.up
    add_column :posts, :lat, :decimal, :precision => 15, :scale => 10
    add_column :posts, :lng, :decimal, :precision => 15, :scale => 10
  end

  def self.down
    remove_column :posts, :lat
    remove_column :posts, :lng
  end
end
