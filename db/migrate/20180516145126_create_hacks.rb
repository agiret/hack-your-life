class CreateHacks < ActiveRecord::Migration[5.1]
  def change
    create_table :hacks do |t|
      t.text :link
      t.integer :vues
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
