@site.templates.find_all { |name, template| File.extname(template.path) == '.erb' }.each do |name, template|
  template.use_filter :erb
end

@site.items.find_all { |item| File.extname(item.origin) == '.erb' && is_include?(item) }.each do |item|
  item.destination.sub! /\.erb$/, '.html'
  item.apply_filter :erb
  item.apply_filter :reduce_empty_lines
end

all_posts.each do |item|
  item.destination = post_url(item) + 'index.html'
  item.apply_filter :erb
  item.apply_filter :kramdown

  # Remove invalid markup from any footnotes.
  item.content.gsub! %r{(<a href="#fn[^>]+) rel="(footnote|reference)"(>)}, '\1\3'

  # Renumber any footnote link IDs so they can play nice if multiple posts are
  # on a page, e.g. `/index.html`.
  item.content.gsub! %r{(id="fn|href="#fn)(ref)?(:\d+")}, '\1\2-' + item.metadata[:published].to_i.to_s + '\3'

  item.apply_template :post

  # Restore any footnote link IDs because this is a single post page.
  item.content.gsub! %r{(id="fn|href="#fn)(ref)?-\d+(:\d+")}, '\1\2\3'

  # Adjust image links pointing to the post to point to the image instead. 
  item.content.gsub! %r{(<a href=")#{post_url(item)}("><img class="[^"]+" src=")([^"]+)}, '\1\3\2\3'

  item.apply_filter :remove_more_marker
  item.apply_filter :reduce_empty_lines
end

all_pages.each do |item|
  item.destination = page_url(item) + 'index.html' unless item.destination != item.origin
  item.apply_filter :erb
  item.apply_filter :kramdown

  if item.metadata.has_key? :template
    item.apply_template item.metadata[:template]
  else
    item.apply_template :page
  end
  item.apply_filter :reduce_empty_lines
end

@site.items.find_all { |item| File.extname(item.origin) == '.erb' && !is_include?(item) }.each do |item|
  item.destination.sub! /\.erb$/, ''
  item.apply_filter :erb
  item.apply_template item.metadata[:template] if item.metadata.has_key? :template
  item.apply_filter :reduce_empty_lines

  if item.destination == '/rss.xml'
    item.apply_filter :remove_more_marker
    item.apply_filter :relative_to_absolute_urls
    item.apply_filter :symbolic_to_numeric_entities
  end
end

@site.items.find_all { |item| File.extname(item.origin) == '.sass' }.each do |item|
  item.destination.sub! /sass$/, 'css'
  item.apply_filter :sass, :style => :compact
  item.content.gsub! /\n+/, "\n"
end

@site.items.find_all { |item| File.extname(item.origin) == '.coffee' }.each do |item|
  item.destination.sub! /coffee$/, 'js'
  item.apply_filter :coffeescript
  item.content.gsub!(/(?:^|\G) {2}/m, "\t")
end

@site.items.find_all { |item| is_include?(item) }.each do |item|
  item.abandon
end

