class VoteController < ApplicationController

	def vote
		question_id = params[:question][:id]
		user_id = current_user.id
		vote = Vote.where(["question_id = :q", { q: question_id }]).where(["user_id = :u", { u: user_id }]).take
		respond_to do |format|
			if vote.nil?
				@vote = Vote.new
				@vote.question = Question.find question_id
				@vote.user = User.find user_id
				@vote.save
				votes = Vote.where(["question_id = :q", { q: question_id }]).count
				format.json { render :json => { :status => true, :votes => votes } }
			end
		end
	end
end