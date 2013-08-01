class VotesController < ApplicationController
	def new
		@poll = Poll.find(params[:poll])
		@vote = Vote.new(:ip_address => request.remote_ip, :item_id => 24)

		@poll.items_count
		if @poll.errors.any?
			flash[:error] = "Sorry, this is an invalid poll. Please make sure the poll has between 2 and 5 items."
			redirect_to edit_poll_path(@poll)
		end
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
