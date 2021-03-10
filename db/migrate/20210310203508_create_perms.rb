class CreatePerms < ActiveRecord::Migration[6.1]
  def change
    create_table :perms do |t|
      t.boolean :bureau, default: false
      t.boolean :ca, default: false
      t.boolean :membre, default: false

      t.timestamps
    end
  end
end
