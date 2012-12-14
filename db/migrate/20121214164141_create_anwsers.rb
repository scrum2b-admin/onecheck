class CreateAnwsers < ActiveRecord::Migration
  def change
    create_table :anwsers do |t|
      t.string :content
      t.integer :question_id
      t.integer :user_id
      t.integer :application_id
      t.string :result_type
      t.string :result_comment

      t.timestamps
    end
  end
end
