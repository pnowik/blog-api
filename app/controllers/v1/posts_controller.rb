module V1

  class PostsController < ApplicationController
    before_action :find_post, only: [:show, :update, :destroy]
    skip_before_action :authorize_request, only: :index

    # GET /posts
    def index
      @posts = Post.all.paginate(page: params[:page], per_page: 20)
      json_response(@posts)
    end

    # POST /posts
    def create
      @post = current_user.posts.create!(post_params)
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
      params.require(:post).permit(:title, :subtitle, :body)
    end

    def find_post
      @post = Post.find(params[:id])
    end
  end


end