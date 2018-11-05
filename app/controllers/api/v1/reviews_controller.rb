class Api::V1::ReviewsController < ApplicationController
  def create
     @tvmovie=Tvmovie.find_by(tmdbid:review_params[:tmdbid])
     if @tvmovie
       @review=@tvmovie.reviews.create(content:review_params[:content],rating:review_params[:rating],user_id:review_params[:user_id])
     else
       @newtvmovie=Tvmovie.create(name:review_params[:name],tmdbid:review_params[:tmdbid],rating_count:review_params[:rating_count],rating_average:review_params[:rating_average])
       @review=@newtvmovie.reviews.create(content:review_params[:content],rating:review_params[:rating],user_id:review_params[:user_id])
     end
     render json: @review
  end

  def get_item_reviews
    @tvmovie=Tvmovie.find_by(tmdbid:params[:tmdbid])
    if @tvmovie
      @reviews=@tvmovie.reviews
      render json: @reviews,each_serializer:ReviewSerializer
    else
      render json:[]
    end
  end

  private

  def review_params
    params.require(:review).permit(:content,:rating,:user_id,:name,:tmdbid,:rating_count,:rating_average)
  end
end
