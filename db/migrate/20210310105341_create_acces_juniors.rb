class CreateAccesJuniors < ActiveRecord::Migration[6.1]
  def change
    create_table :acces_juniors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :junior, null: false, foreign_key: true

      t.timestamps
    end
  end
end
