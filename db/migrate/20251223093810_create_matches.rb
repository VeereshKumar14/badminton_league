class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches do |t|
      t.references :winner, null: false, foreign_key: true
      t.references :loser, null: false, foreign_key: true
      t.integer :winner_score
      t.integer :loser_score

      t.timestamps
    end
  end
end
