class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.references :question
    	t.references :user
    end
  end
end
