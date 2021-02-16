class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_name
      t.integer :difficulty
      t.jsonb :starting_board
      t.jsonb :board_in_progress
      t.jsonb :solved_board
      t.jsonb :removed_values
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
