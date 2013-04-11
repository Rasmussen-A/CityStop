class ItinerariesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @itineraries = current_user.itineraries
  end

end
