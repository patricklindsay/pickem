class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :home_team, index: true
      t.references :away_team, index: true
      t.references :stadium, index: true
      t.references :result
      t.datetime :kickoff_at

      t.timestamps
    end
  end
end
