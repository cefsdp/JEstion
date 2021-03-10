class CreateMembres < ActiveRecord::Migration[6.1]
  def change
    create_table :membres do |t|
      t.boolean :alumni
      t.references :acces_junior, null: false, foreign_key: true

      t.timestamps
    end
  end
end
