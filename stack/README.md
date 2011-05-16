remember how to handle exceptions with rails/datamapper


class ApplicationController < ActionController::Base
  rescue_from DataMapper::ObjectNotFoundError, :with => :not_found

  def not_found
    render file => "public/404.html", status => 404, layout => false
  end
end

class PostsController
  def show
    @post = Post.get!(params[:id]) # This will throw an DataMapper::ObjectNotFoundError if it can't be found
    @comments = @post.comments
  end
end