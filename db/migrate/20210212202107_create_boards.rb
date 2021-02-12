class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_name
      t.string :starting_board
      t.string :solved_board
      t.string :board_in_progress
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
