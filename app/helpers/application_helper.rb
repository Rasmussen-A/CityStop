module ApplicationHelper

  def title(page_title)
    content_for(:title){ page_title }
  end

  def javascript(*files)
    content_for(:head){ javascript_include_tag(*files) }
  end

  def is_active(link_controller)
    params[:controller] == link_controller ? 'active' : nil
  end

end # ApplicationHelper
