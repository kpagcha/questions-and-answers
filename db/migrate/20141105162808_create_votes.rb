class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :yes
      t.boolean :no
      t.references :question_id, index: true
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
