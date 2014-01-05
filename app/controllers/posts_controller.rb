class PostsController < ApplicationController
    def index
        @posts = Post.scoped
    end
end
