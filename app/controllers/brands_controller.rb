class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only:[:edit, :update, :show, :destroy]
  
  
  def index
    @brands = Brand.all
  end
  
  def show
  end
  
  def new
  @brand = Brand.new
  end
  
  def edit
  end
  
  def create
  @brand = current_user.brands.new(set_brand)
  if @brand.save
    flash[:notice] = "Brand was successfully created"
    redirect_to brand_path (@brand)
  else
    render 'new'
  end
  
  def update
  if @brand.update(set_brand)
    flash[:notice] = "Brand was successfully updated"
    redirect_to brand_path(@brand)
  else
    render 'edit'
  end
end
  
  def destroy
    if @brand.destroy
      flash[:notice] = "Brand #{@brand.name}, was successfully destroyed"
      redirect_to brands_path
    end
  end
end
  
  
  
  
  
  
  
  
  private 
  def find_brand
    @brand = Brand.find(params[:id])
  end
  
  def set_brand
    params.require(:brand).permit(:name)
  end
end
