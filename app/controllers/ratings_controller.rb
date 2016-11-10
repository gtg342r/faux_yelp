class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    render("ratings/index.html.erb")
  end

  def show
    @rating = Rating.find(params[:id])

    render("ratings/show.html.erb")
  end

  def new
    @rating = Rating.new

    render("ratings/new.html.erb")
  end

  def create
    @rating = Rating.new

    @rating.user_id = params[:user_id]
    @rating.restaurant_id = params[:restaurant_id]
    @rating.stars = params[:stars]

    save_status = @rating.save

    if save_status == true
      redirect_to(:back, :notice => "Rating created successfully.")
    else
      render("ratings/new.html.erb")
    end
  end

  def edit
    @rating = Rating.find(params[:id])

    render("ratings/edit.html.erb")
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.user_id = params[:user_id]
    @rating.restaurant_id = params[:restaurant_id]
    @rating.stars = params[:stars]

    save_status = @rating.save

    if save_status == true
      redirect_to(:back, :notice => "Rating updated successfully.")
    else
      render("ratings/edit.html.erb")
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    if URI(request.referer).path == "/ratings/#{@rating.id}"
      redirect_to("/", :notice => "Rating deleted.")
    else
      redirect_to(:back, :notice => "Rating deleted.")
    end
  end
end
