class VoteController < ApplicationController
	respond_to :json

	def vote
		question_id = params[:question][:id]
		user_id = current_user.id
		vote = Vote.where(["question_id = :q", { q: question_id }]).where(["user_id = :u", { u: user_id }]).take
		respond_with do |format|
			if vote.nil?
				@vote = Vote.new
				@vote.question = Question.find question_id
				@vote.user = User.find user_id
				@vote.save
				format.json { render :json => { :status => 'ok' } }
			else				
				format.json { render :json => { :status => 'failed', :msg => 'You already voted' } }
			end
		end
	end
end