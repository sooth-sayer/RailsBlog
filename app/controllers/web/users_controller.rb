class Web::UsersController < Web::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  add_breadcrumb :users, :users_path

  def index
    @users = User.page params[:page]
  end

  def show
    add_breadcrumb @user.name, @user
  end

  def new
    add_breadcrumb :new
    @user = User.new
  end

  def edit
    add_breadcrumb @user.name, @user
    add_breadcrumb :update
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t("notice.successfully")
    else
      render action: "new"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t("notice.successfully")
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
