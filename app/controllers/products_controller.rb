class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_category, only: %i[ index show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    @users = User.all


    if params[:sku].present?
      @products = @products.where("sku ILIKE ?", "%#{params[:sku]}%")
    end
    # if params[:name].present?
    #   @categories = @categories.where("name = ?", params[:name])
    # end
  end

  # GET /products/1 or /products/1.json
  def show
    @pagy, @scores = pagy(Score.all)
    @scores = Score.where(product_id: @product.id).order("created_at DESC")

    if @scores.blank?
      @average_score = 0
    else
      @average_score = @scores.average(:rating).round(2)
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    true
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_category
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :stock, :price, :image, :sku,{category_ids: []}, categories_attributes: [:name], users_attributes: [:role])
    end
end
