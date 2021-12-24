module ApplicationHelper
  def url_to_content(str)
    str.gsub! (%r{https://[^\s<]+}) do |url|
      if url[/(?:png|jpe?g|gif|svg)$/]
        "<img src='#{url}' width = '300' />"
      else
        "<a href='#{url}' >#{url}</a>"
      end
    end
    str.html_safe
  end

end
