class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_name
      t.integer :starting_board, array: true
      t.integer :solved_board, array: true
      t.integer :board_in_progress, array: true
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
