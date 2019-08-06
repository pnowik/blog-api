class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    json_response(@posts)
  end

  # POST /posts
  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  # GET /posts/:id
  def show
    json_response(@post)
  end

  # PUT /posts/:id
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    # whitelist params
    params.require(:post).permit(:title, :subtitle, :body, :created_by)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
