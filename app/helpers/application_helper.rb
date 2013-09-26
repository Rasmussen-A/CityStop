module ApplicationHelper

  def title(page_title)
    content_for(:title){ page_title }
  end # page_title

  def asset_exist?(asset)
    Rails.application.assets.find_asset(asset)
  end

  def is_active(link_controller)
    params[:controller] == link_controller ? 'active' : nil
  end

  def place_notification
    haml_tag(:div, class: 'error')
    content_tag(:div, flash[:alert], class: 'alert') if flash[:alert]
    content_tag(:div, flash[:notice], class: 'notice') if flash[:notice]
  end

end # ApplicationHelper
