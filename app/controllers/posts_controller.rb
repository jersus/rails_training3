class PostsController < ApplicationController
    before_filter :find_post, :except => [ :index ]

    def index
        @posts = Post.scoped
    end

    def new
    end

    def edit
    end

    def show
    end

    def create
        if @post.save
            redirect_to( post_path( @post ), :flash => { :success => "created" } )
        else
            flash[ :error ] = @post.errors.full_messages
            render :new
        end
    end

    def update
        if @post.update_attributes( params[ :post ] )
            redirect_to( posts_path, :flash => { :success => "updated" } )
        else
            flash[ :error ] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to( posts_path, :flash => { :success => 'deleted' } )
    end

    private
        def find_post
            @post = params[ :id ] ? Post.find( params[ :id ] ) : Post.new( params[ :post ] )
        end
end
