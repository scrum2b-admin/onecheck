class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :content
      t.boolean :is_correct
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
