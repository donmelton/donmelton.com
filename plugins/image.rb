def image(src, args = {})
  return '' if src.empty?

  src = @config[:cdn_url] + src if src =~ %r{^/media/}

  content = '<img '

  content += %(class="align-#{args[:align] || 'full'}" )
  content += %(src="#{src}" )
  content += %(width="#{args[:width]}" ) unless args[:width].nil?
  content += %(height="#{args[:height]}" ) unless args[:height].nil?
  content += %(alt="#{args[:alt] || ''}" )

  link = args[:link].to_s || ''

  if args[:title].nil?
    if link == 'post'
      content += %(title="#{strip_html(markdown_inline(@item.metadata[:title]))}" )
    else
      content += %(title="#{args[:alt]}" ) unless args[:alt].nil?
    end
  else
    content += %(title="#{args[:title]}" )
  end

  content += '/>'

  unless link.empty?

    case link
    when 'self'
      link = src
    when 'post'
      link = post_url(@item)
    else
      link = @config[:cdn_url] + link if link =~ %r{^/media/}
    end

    content = %(<a href="#{link}">#{content}</a>)
  end

  content
end
