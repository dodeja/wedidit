class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :name, :string
      t.column :email, :string
      t.column :content, :text
      t.column :published, :boolean
      t.column :city, :string
      t.column :state, :string
      t.column :country, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
