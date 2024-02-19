class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.author_id = params.fetch("query_author_id")
    comment.venue_id = params.fetch("query_venue_id")
    comment.body = params.fetch("query_body")
    comment.save
    
    if comment.valid?
      comment.save
      redirect_to("/venues/#{comment.venue_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/venues/#{comment.venue_id}", { :notice => "Comment failed to create successfully." })
    end
  end
end
