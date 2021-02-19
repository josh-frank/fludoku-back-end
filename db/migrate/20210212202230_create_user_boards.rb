class CreateUserBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_boards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :board, null: false, foreign_key: true
      t.boolean :solved, default: false
      t.boolean :failed, default: false
      t.integer :timer, default: 0

      t.timestamps
    end
  end
end
