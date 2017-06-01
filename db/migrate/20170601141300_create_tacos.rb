class CreateTacos < ActiveRecord::Migration[5.0]
  def change
    create_table :tacos do |t|
      t.string :meat
      t.boolean :rice
      t.boolean :salsa
      t.boolean :others
      t.text :note

      t.timestamps
    end
  end
end
