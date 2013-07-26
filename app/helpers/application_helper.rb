module ApplicationHelper

  def title(page_title)
    content_for(:title){ page_title }
  end # page_title

end # ApplicationHelper
