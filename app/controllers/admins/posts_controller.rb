class Admins::PostsController < AdminsController 
  def index
    @posts = Post.friendly.order("published_at ASC")
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to admins_posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
   
    if @post.update(post_params)
      redirect_to :back
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to admins_posts_path 
  end

  private

  def post_params
    params.require(:post).permit(
      :admin_id,
      :body,
      :feature_image,
      :published_at,
      :published,
      :slugged,
      :title,
    )
  end
end
