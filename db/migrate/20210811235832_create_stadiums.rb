class CreateStadiums < ActiveRecord::Migration[6.1]
  def change
    create_table :stadiums do |t|
      t.string :code
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
