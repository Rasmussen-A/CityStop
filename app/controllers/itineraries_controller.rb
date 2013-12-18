class ItinerariesController < ApplicationController
  # User shall be signed in
  # to access any of itineraries actions
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    # Load all user itineraries on index action
    @itineraries = current_user.itineraries
    respond_with(@itineraries)
  end

  def public
    @itineraries = Itinerary.all
    respond_with(@itineraries)
  end

  def create
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
    @itinerary = Itinerary.find(params[:id])
    respond_with(@itinerary)
  end

end
