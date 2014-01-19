class BoardsController < ApplicationController
  before_filter :find_board, :except => [ :index ]

  def index
    @boards = Board.scoped
  end

  def show
  end

  def new
  end

  def create
    if @board.save
      redirect_to( board_path( @board ), :flash => { :success => "Board success created!" } )
    else
      flash.now[ :error ] = @board.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update_attributes( params[ :board ] )
      redirect_to( boards_path, :flash => { :success => "Board success updated" } )
    else
      flash.now[ :error ] = @board.errors.full_messages
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to( boards_path, :flash => { :success => "Board success deleted" } )
  end

  private
    def find_board
      @board = params[ :id ] ? Board.find( params[ :id ] ) : Board.new( params[ :board ] )
    end
end
