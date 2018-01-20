class PostsController < ApplicationController

  http_basic_authenticate_with name: "mk", password: "secret",
  except: [:index, :show]

  def index
    # location = request.remote_ip
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # render plain: params[:post].inspect

    # @post = Post.new(params[:post])
    # strong parameters ... req us to tell rails what params are allowed
    # @post = Post.new(params.require(:post).permit(:text))
    # the above line is often factored into own method so that it can be reused
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end
end
