# Hack to remove whitespace before content and empty lines, i.e. extra
# carriage returns, after HTML or XML tags or CDATA statements.

class ReduceEmptyLines < Magneto::Filter

  def name
    'reduce_empty_lines'
  end

  def apply(content, ivars)
    content.lstrip.gsub(/(>\n)\n+/, '\1').gsub(/(<!\[CDATA\[\n)\n+/, '\1')
  end
end
