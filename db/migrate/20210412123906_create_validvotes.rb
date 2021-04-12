class CreateValidvotes < ActiveRecord::Migration[6.1]
  def change
    create_table :validvotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.boolean :isVoted, default: false

      t.timestamps
    end
  end
end
