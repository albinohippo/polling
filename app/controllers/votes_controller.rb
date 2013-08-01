class VotesController < ApplicationController
	def new
		@poll = Poll.find(params[:poll])
		@vote = Vote.new(:ip_address => request.remote_ip, :item_id => 24)
	end

	def create
		@vote = Vote.new(params[:vote])
		@poll = Item.find(@vote.item_id).poll
		if @poll.has_ip?(@vote.ip_address)
			flash[:error] = 'You have already voted in this poll.'
			redirect_to polls_path
		else
			if @vote.save
				redirect_to poll_path(@poll), :notice => 'Vote cast successfully!'
			else
				render action: 'new'
			end
		end
	end
end
