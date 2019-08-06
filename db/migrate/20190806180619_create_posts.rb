class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :subtitle
      t.text :body
      t.string :created_by

      t.timestamps
    end
  end
end
