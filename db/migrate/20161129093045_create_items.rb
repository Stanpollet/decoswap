class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.string :size
      t.integer :price
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
