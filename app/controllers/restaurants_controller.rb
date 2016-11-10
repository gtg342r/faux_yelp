class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    render("restaurants/index.html.erb")
  end

  def show
    @tag = Tag.new
    @rating = Rating.new
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/show.html.erb")
  end

  def new
    @restaurant = Restaurant.new

    render("restaurants/new.html.erb")
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:name]
    @restaurant.city = params[:city]
    @restaurant.neighborhood = params[:neighborhood]
    @restaurant.description = params[:description]
    @restaurant.address = params[:address]
    @restaurant.website = params[:website]
    @restaurant.cover_photo = params[:cover_photo]

    save_status = @restaurant.save

    if save_status == true
      redirect_to(:back, :notice => "Restaurant created successfully.")
    else
      render("restaurants/new.html.erb")
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/edit.html.erb")
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.city = params[:city]
    @restaurant.neighborhood = params[:neighborhood]
    @restaurant.description = params[:description]
    @restaurant.address = params[:address]
    @restaurant.website = params[:website]
    @restaurant.cover_photo = params[:cover_photo]

    save_status = @restaurant.save

    if save_status == true
      redirect_to(:back, :notice => "Restaurant updated successfully.")
    else
      render("restaurants/edit.html.erb")
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    if URI(request.referer).path == "/restaurants/#{@restaurant.id}"
      redirect_to("/", :notice => "Restaurant deleted.")
    else
      redirect_to(:back, :notice => "Restaurant deleted.")
    end
  end
end
