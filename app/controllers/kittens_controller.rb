class KittensController < ApplicationController
  before_action :find_kitten, only: [:edit, :show, :update, :destroy]
  
  def index
    @kittens = Kitten.all
  end
  
  def show

  end
  
  def new
    @kitten = Kitten.new
  end
  
  def edit

  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Congratulations! Kitten saved!"
      redirect_to kittens_path
    else
      flash.now[:danger] = "Please fix the errors!"
      render :new
    end
  end
  
  def update
    if @kitten.update(kitten_params)
      flash[:success] = "The kitten info has been updated!"
      redirect_to kittens_path
    else
      flash.now[:danger] = "The information provided couldn't be saved!"
      render :edit
    end
  end
  
  def destroy
    @kitten.destroy
    flash[:success] = "The kitten was deleted!"
    redirect_to kittens_path
  end
  
  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
    
    def find_kitten
      @kitten = Kitten.find(params[:id])
    end
end
