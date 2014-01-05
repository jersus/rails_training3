class PostsController < ApplicationController
    def index
        @posts = Post.scoped
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find( params[ :id ] )
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

    def update
        @post = Post.find( params[:id] )
        if @post.update_attributes( params[ :post ] )
            redirect_to( posts_path, :flash => { :success => "updated" } )
        else
            flash[ :error ] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find( params[ :id ] )
        @post.destroy
        redirect_to( posts_path, :flash => { :success => 'deleted' } )
    end
end
