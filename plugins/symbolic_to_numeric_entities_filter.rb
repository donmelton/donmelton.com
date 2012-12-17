# Hack using a kramdown utility to convert symbolic entities (e.g. `&amp;`) to
# their numerical equivalents (e.g. `&#38;). Used for XML output.

require 'kramdown'

class SymbolicToNumericEntities < Magneto::Filter

  def name
    'symbolic_to_numeric_entities'
  end

  def apply(content, ivars)
    content.gsub(/&\w+;/) { |match| "&##{Kramdown::Utils::Entities::entity(match[1..-2]).code_point};" }
  end
end
