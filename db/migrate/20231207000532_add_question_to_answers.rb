class AddQuestionToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :question, :text
  end
end
