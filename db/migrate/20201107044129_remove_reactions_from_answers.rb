class RemoveReactionsFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :reactions, :json
  end
end
