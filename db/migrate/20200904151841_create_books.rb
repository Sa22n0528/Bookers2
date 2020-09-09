class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.timestamps
      t.integer :user_id
      t.string :title
      t.string :body
    end
  end
end
