class AddLikableColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :likers_count, :integer, :default => 0
  end
end
