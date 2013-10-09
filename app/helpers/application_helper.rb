module ApplicationHelper

  def title(page_title)
    content_for(:title){ page_title }
  end

  def asset_exist?(asset)
    Rails.application.assets.find_asset(asset)
  end

  def is_active(link_controller)
    params[:controller] == link_controller ? 'active' : nil
  end

end # ApplicationHelper
