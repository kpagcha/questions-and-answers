class AddAnswerIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :answer, index: true
  end
end
