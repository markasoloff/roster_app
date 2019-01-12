class CreateEngineers < ActiveRecord::Migration[5.2]
  def change
    create_table :engineers do |t|
      t.string :name
      t.string :image_url
      t.string :title
      t.text :bio
      t.integer :vote

      t.timestamps
    end
  end
end
