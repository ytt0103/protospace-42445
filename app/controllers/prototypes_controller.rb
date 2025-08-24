class PrototypesController < ApplicationController
  # STEP117: ログインしているユーザーだけにアクセスを許可する
  # ただし、トップページと詳細ページは除外する
  before_action :authenticate_user!, except: [:index, :show]

  # edit, update, destroyアクションの前に@prototypeを準備する
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  # STEP119: 投稿者以外は編集ページにアクセスできないようにする
  before_action :correct_user, only: [:edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    # @prototype = Prototype.find(params[:id])
  end

  def update
    # @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def destroy
    # @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def correct_user
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless @prototype.user_id == current_user.id
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end