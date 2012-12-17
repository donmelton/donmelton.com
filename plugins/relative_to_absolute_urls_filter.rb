# Hack to convert relative URLs (e.g. </about/index.html>) to absolute URLs
# (e.g. <http://donmelton.com/about/index.html>). Used for XML output.

class RelativeToAbsoluteURLs < Magneto::Filter

  def name
    'relative_to_absolute_urls'
  end

  def apply(content, ivars)
    content.gsub(/(<[^>]+\s+(href|src)=["'])\//, '\1' + @config[:base_url] + '/')
  end
end
