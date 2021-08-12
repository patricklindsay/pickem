class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.references :player, index: true
      t.references :scorable, polymorphic: true

      t.timestamps
    end
  end
end
