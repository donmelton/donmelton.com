# Hack using kramdown to convert Markdown text into single lines of HTML.

require 'kramdown'

def markdown_inline(content)
  # Strip carriage returns from input and paragraph elements from output.
  Kramdown::Document.new(content.to_s.gsub(/\n/, '').strip, (@config[:kramdown].symbolize_keys rescue {})).to_html.chomp.sub(/^<p>(.*)<\/p>$/, '\1')
end
