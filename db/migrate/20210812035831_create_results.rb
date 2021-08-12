class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :match, index: true
      t.integer :away_team_score
      t.integer :home_team_score

      t.timestamps
    end
  end
end
