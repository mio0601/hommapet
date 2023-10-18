class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :category
      t.text :question
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddImageToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :image, :string
  end
end
