class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :content, null: false, default:""
      t.integer :up_vote
      t.integer :down_vote

      t.timestamps
    end
  end
end
