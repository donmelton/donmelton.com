# Copied from `liquid/standardfilters.rb` with thanks to Tobias Luetke.

def strip_html(input)
  input.to_s.gsub(/<script.*?<\/script>/, '').gsub(/<.*?>/, '')
end
