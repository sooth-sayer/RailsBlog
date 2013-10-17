class Web::PostsController < Web::ApplicationController
  http_basic_authenticate_with name: configus.user.name, password: configus.user.password, except: [:index, :show] unless Rails.env.test?

  add_breadcrumb :posts, :posts_path

  decorates_assigned :post

  def index
    @posts = Post.published.page params[:page]
  end

  def new
    add_breadcrumb :new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, @post
    add_breadcrumb :update
  end

  def create
    @post = Post.new(get_post_all_params)

    if @post.save
      f(:success)
      redirect_to @post
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(get_post_all_params)
      f(:success)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      f(:success)
    end

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, @post
  end

  private
  def get_post_all_params
    params.require(:post).permit(post_params, :comments_attributes => comment_params)
  end

  def post_params
    [:title, :text, :picture, :state_event, :user_id]
  end

  def comment_params
    [:id, :body, :post_id, :commenter_id]
  end
end
