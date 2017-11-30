class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.column :user_id, :integer
      t.column :description, :string

      t.timestamps
    end
  end
end
