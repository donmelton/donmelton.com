require 'time'

def copyright_year(starting_year)
  current_year = Time.now.strftime("%Y")

  if starting_year.to_i < current_year.to_i
    starting_year.to_s + '&ndash;' + current_year
  else
    current_year
  end
end
