class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :type
      t.string :solution
      t.integer :interview_id
      t.integer :user_id

      t.timestamps
    end
  end
end
