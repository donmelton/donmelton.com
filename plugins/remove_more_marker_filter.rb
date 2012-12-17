# Hack to remove `<!-- more -->` marker from post pages and RSS feed.

class RemoveMoreMarker < Magneto::Filter

  def name
    'remove_more_marker'
  end

  def apply(content, ivars)
    content.gsub(/\s*<!--\s*more\s*-->\s*/i, "\n")
  end
end
