class ProductsController < ApplicationController
    before_action :private_access, except: [:index, :show]

	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
		
	end
	
	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "Post successfully created"			
			redirect_to products_path

		else
			render :new
		end
	end
	
	def show
		@product = Product.find(params[:id])
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = "Post successfully created"
		    redirect_to products_path
		else
			render :edit
		end
	end
	
	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to products_path, notice: "El producto fue eliminado con éxito"
	end
	
	private
	def product_params	
		params.require(:product).permit(:name, :url, :description)
	end
end