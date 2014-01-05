class PostsController < ApplicationController
    def index
        @posts = Post.scoped
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find( params[ :id ] )
    end

    def create
        @post = Post.new( params[:post] )
        if @post.save
            redirect_to( post_path( @post ), :flash => { :success => "created"} )
        else
            flash[ :error ] = @post.errors.full_messages
            render :new
        end
    end
end
