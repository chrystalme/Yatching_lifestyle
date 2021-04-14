class ArticlesController < ApplicationController
  before_action :logged_in?
  # before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all.ordered_by_most_recent
  end

  def new
    @article = current_user.articles.build
    @category_options = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "#{@article.title} has been created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def category
    @category = Article.all.where(Article.find(params[:id]).categories.pluck(:name))
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end

  # def set_article    
  # end
end
