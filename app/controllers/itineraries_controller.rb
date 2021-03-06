class ItinerariesController < ApplicationController
  # User shall be signed in
  # to access any of itineraries actions
  before_filter :authenticate_user!

  def index
    # Load all user itineraries on index action
    @itineraries = current_user.itineraries
  end

  def create
    # Build new empty itinerary (params from model, I quess)
    # Then fill it with user data and saving
    itinerary = current_user.itineraries.build(params[:itinerary])
    itinerary.save
    redirect_to itineraries_path
  end

  def edit
    # Load all user itineraries, then searching by id
    @itineraries = current_user.itineraries
    @itinerary = @itineraries.find(params[:id])
  end

  def update
    # I suppose all other actions is self-descriptive
    itinerary = current_user.itineraries.find(params[:id])
    itinerary.update_attributes(params[:itinerary])
    itinerary.save
    redirect_to itineraries_path
  end

  def destroy
    itinerary = current_user.itineraries.find(params[:id])
    itinerary.destroy
    redirect_to itineraries_path
  end

  def show
    @itinerary = current_user.itineraries.find(params[:id])
  end

end
