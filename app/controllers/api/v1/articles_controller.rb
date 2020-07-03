module Api::V1
  class ArticlesController < BaseApiController
    def index
      articles = Article.all
      render json: articles
    end

    def show
      article = Article.find(params[:id])
      render json: article
    end
  end
end
