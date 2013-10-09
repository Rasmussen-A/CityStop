module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = "<ul>#{messages}</ul>"

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
