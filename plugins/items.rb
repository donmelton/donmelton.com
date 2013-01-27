module Magneto

  class Item
    attr_accessor :url
  end
end

POSTS_MATCH_PATTERN = %r{^/\d{4}[-\/]\d{2}[-\/]\d{2}[-\/].+\.md$}

def sorted_posts
  @@sorted_posts ||= all_posts.sort_by { |item| Time.parse item.metadata[:published].to_s }.reverse
end

def all_posts
  @@all_posts ||= @site.items.find_all { |item| item.origin =~ POSTS_MATCH_PATTERN }
end

def post_url(item)
  item.url ||= item.origin.sub(%r{^(/\d{4})[-\/](\d{2})[-\/](\d{2})[-\/](.+)\.md$}, '\1/\2/\3/\4/')
end

def post_format(item)
  if item.metadata.has_key? :format
    item.metadata[:format]
  elsif item.metadata.has_key? :link
    'link'
  else
    'standard'
  end
end

def post_format_has_title?(fmt)
  case fmt
  when 'standard', 'link'
    true
  else
    false
  end
end

# Does not include home page `index.erb` item as output...
def all_pages
  @@all_pages ||= @site.items.find_all { |item| item.origin =~ %r{^/.+\.md$} && item.origin !~ POSTS_MATCH_PATTERN }
end

# ... but works for home page `index.erb` item as input.
def page_url(item)
  item.url ||= item.origin.sub(%r{(/index)?\.(erb|md)$}, '/')
end

def is_include?(item)
  item.origin =~ %r{^/includes/.+}
end
