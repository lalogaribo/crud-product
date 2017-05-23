class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only:[:edit, :update, :show, :destroy]
  
  def index
   @products = current_user.products.all
  end
  
  def show
  end
  
  def new
    @product = Product.new
  end
  
  def edit
  end
  
  def create
  @product = current_user.products.new(set_product)
  if @product.save
    flash[:notice] = "Product was successfully reated"
    redirect_to products_path(@product)
  else
    render 'new'
  end
end

  def update
    if @product.update(set_product)
      flash[:notice] = "Product was successfully Updated"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end
  
  def destroy
    if @product.destroy
      flash[:notice] = "Product #{@product.name}, was successfully destroyed"
      redirect_to products_path
    end
  end
  
  
  
  
  
  private
  def find_product
    @product = Product.find(params[:id])
  end
  
  def set_product
    params.require(:product).permit(:name, :description, :price, :brand_id)
  end
  
end
