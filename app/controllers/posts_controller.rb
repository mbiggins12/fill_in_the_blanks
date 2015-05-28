class PostsController < ApplicationController
	
	def index
		@posts = Post.all.order(:bru_name)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @posts #Ask why not posts_path here?
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update
			redirect_to @posts
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])

		@post.destroy
		redirect_to posts_path
	end

private
	def post_params
		params.require(:post).permit(:bru_name, :title, :body)
	end
end
