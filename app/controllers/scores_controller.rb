class ScoresController < ApplicationController
  
  before_action :set_score, only: [:show, :edit, :update, :destroy]
  before_action :set_product
  before_action :authenticate_user!

  def index
    @scores = Score.all
  end

  def new
    @score = Score.new
  end

	def show
		
	end

  def edit
  end

  def create

    # @userScore = Score.find_by(user_id: current_user.id, product_id: params[:porduct_id])
    # @scoreCreate = Score.create(user_id: current_user.id, product_id: params[:porduct_id])

    @score = Score.new(score_params)
    @score.user_id = current_user.id
    @score.product_id = @product.id

    if @score.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @score.update(score_params)
  end

  def destroy
    @score.destroy
    redirect_to root_path
  end

  private
    def set_score
      @score = Score.find(params[:id])
    end

    #ahora que estan nesteados scores dentro de product en routes ponemos set_product y un before_action para setearlos antes
    def set_product
      @product = Product.find(params[:product_id])
    end

    def score_params
      params.require(:score).permit(:rating, :comment, :user_id)
    end
end