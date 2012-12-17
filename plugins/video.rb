def video(src, args = {})
  return '' if src.empty?

  width = args[:width] || @config[:content_width] || 640
  aspect = args[:aspect] || ''

  if aspect =~ /^\s*([\d.]+)[x:]([\d.]+)\s*$/
    scale = $2.to_f / $1.to_f
  else
    scale = 3.0 / 4.0
  end

  %(<iframe class="video" src="#{src}" width="#{width}" height="#{(width * scale).to_i}"></iframe>)
end

def youtube(id, args = {})
  video 'http://www.youtube.com/embed/'           + id.to_s, args
end

def vimeo(id, args = {})
  video 'http://player.vimeo.com/video/'          + id.to_s, args
end

def collegehumor(id, args = {})
  video 'http://www.collegehumor.com/e/'          + id.to_s, args
end

def dailymotion(id, args = {})
  video 'http://www.dailymotion.com/embed/video/' + id.to_s, args
end
