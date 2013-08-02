class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :video
      t.string :caption

      t.timestamps
    end
  end
end
