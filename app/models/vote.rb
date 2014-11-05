class Vote < ActiveRecord::Base
  belongs_to :question_id
  belongs_to :user_id
end
