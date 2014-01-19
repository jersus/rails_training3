class CategoriesController < ApplicationController
  before_filter :find_category, :except => [ :index ]

  def index
    @categories = Category.scoped
  end

  def show
  end

  def new
  end

  def create
    if @category.save
      redirect_to( category_path( @category ), :flash => { :success => "Category success created!" } )
    else
      flash.now[ :error ] = @category.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes( params[ :category ] )
      redirect_to( categories_path, :flash => { :success => "Category success updated!" } )
    else
      flash.now[ :error ] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to( categories_path, :flash => { :success => "Category success deleted!" } )
  end

  private
    def find_category
      @category = params[ :id ] ? Category.find( params[ :id ] ) : Category.new( params[ :category ] )
    end
end
