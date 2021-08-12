class CreateGuesses < ActiveRecord::Migration[6.1]
  def change
    create_table :guesses do |t|
      t.string :session_id, index: true
      t.references :match, index: true
      t.integer :away_team_score
      t.integer :home_team_score
      t.boolean :correct

      t.timestamps
    end
  end
end
