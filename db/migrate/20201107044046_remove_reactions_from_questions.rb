class RemoveReactionsFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :reactions, :json
  end
end
