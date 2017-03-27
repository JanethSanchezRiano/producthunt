class ProductsController < ApplicationController
  def index
    @products = Product.all
 end

 def new
   @product = Product.new
   @product = Product.new(products_params)
   if @product.save
     redirect_to products_path, notice: "El producto fue publicado con exito"
  else
    render :new
  end
 end

 def show
   @product = Product.find(params[ :id])
 end

 def edit
   @product = Product.find(params[ :id])
   end

   def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to products_path, notice: "El producto ha sido modificado con éxito"
  else
    render :edit
  end
end


 private
  def products_params
    params.require(:product).permit(:name,  :url, :description)
  end


end
