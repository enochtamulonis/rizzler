class CreatePickupLines < ActiveRecord::Migration[7.1]
  def change
    create_table :pickup_lines do |t|
      t.text :text
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
