class CreateJuniors < ActiveRecord::Migration[6.1]
  def change
    create_table :juniors do |t|
      t.string :name
      t.string :description
      t.boolean :alpha, default: false
      t.boolean :beta, default: false

      t.timestamps
    end
  end
end
