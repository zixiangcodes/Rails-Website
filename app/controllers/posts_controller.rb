class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc).page(params[:page]).per(6)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

 # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    Rails.logger.info("Attempting to create post with params: #{post_params.inspect}")

    # Remove the image if the remove_image checkbox was checked
    @post.image.purge if params[:post][:remove_image] == '1'

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  rescue => e
    Rails.logger.error("Error creating post: #{e.message}")
    Rails.logger.error(e.backtrace.join("\n"))
    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity, notice: 'Error creating post. Please try again.' }
      format.json { render json: { error: 'Error creating post' }, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        @post.image.purge if params[:post][:remove_image] == '1'
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :image, :remove_image)
    end

end
