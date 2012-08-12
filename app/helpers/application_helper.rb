module ApplicationHelper

  def print_sectors(sector_array)
    string = ""
    sector_array.each do |sector|
      string += "#{link_to sector.name, ''}, "
    end
    return string
  end
  
end
