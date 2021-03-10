class AddPermsIdToAccesJuniors < ActiveRecord::Migration[6.1]
  def change
    add_reference :acces_juniors, :perms, null: false, foreign_key: true
  end
end
