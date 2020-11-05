class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :author
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
