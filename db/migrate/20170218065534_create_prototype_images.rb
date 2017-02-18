class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      
      t.timestamps null: false
      t.references :prototype
      t.text :image_url
      t.integer :role
    end
  end
end
