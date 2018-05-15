class ArticlesController < ApplicationController
  
  layout false

  http_basic_authenticate_with name: "josiah", password: 'asdf', except: [:index, :show]
  
  def index
    @articles = Article.all
    # render plain: @articles.inspect
  end

  def new
    @article = Article.new
  end
  
  def create 
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update 
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def sms
    KannelRails.send_message("+639001234567", "Hello")
  end

  private 

    def article_params
      params.require(:article).permit(:title, :text)
    end

end
