require 'csv'

Event.destroy_all
Venue.destroy_all
Person.destroy_all
Sector.destroy_all
Company.destroy_all
Attendance.destroy_all
Filter.destroy_all
List.destroy_all
Tag.destroy_all
Tracker.destroy_all

CSV.foreach("app/assets/data/venue.csv") do |row|
  #venue_name,venue_street,venue_city,venue_state,venue_zipcode,venue_country
  Venue.create!(address: row[1], city: row[2], state: row[3], zip_code: row[4], country: row[5], name: row[0])
end

CSV.foreach("app/assets/data/event.csv") do |row|
  #event_perma,event_name,event_description,venue,event_startdate,event_enddate,sectors,website
  d_start = row[4].present? ? row[4].split('/') : [8,25,2012]
  d_end = row[5].present? ? row[5].split('/') : [8,25,2012]
  if row[6].present? && row[6].include?(';')
    sectors = row[6].split(';')
  elsif row[6].present?
    sectors = row[6].split(',')
  else
    sectors = ['TBD']
  end
  
  start_date = Date.new(d_start[2].to_i, d_start[0].to_i, d_start[1].to_i)
  end_date = Date.new(d_end[2].to_i, d_end[0].to_i, d_end[1].to_i)
  
  venue = Venue.find_or_create_by_name(row[3])
  
  # Don't create event if name is blank
  if row[1].present?
    event_perma_name = row[1].gsub(' ','_').downcase
  
    event = Event.create!(perma_name: event_perma_name, name: row[1], description: row[2], venue_id: venue.id,
                          url: row[7], event_start_date: start_date, event_end_date: end_date)

    sectors.each do |sector|
      sector_record = Sector.find_or_create_by_name(sector.capitalize)
      Tag.create!(sector_id: sector_record.id, taggable_id: event.id, taggable_type: 'Event')
    end 
  end
end

CSV.foreach("app/assets/data/companies.csv") do |row|
  #company_url;company_perma;company_name;company_description;Zipcode;Country;fb_perma;tw_perma

  Company.create!(url: row[0], company_perma: row[1], name: row[2], description: row[3], zipcode: row[4],
                  country: row[5], fb_perma: row[6], tw_perma: row[7])

end

# CSV.foreach("app/assets/data/attending_people.csv") do |row|
#   #event_perma,first_name,last_name,person_role,company_name,company_url  
#   event = Event.find_or_create_by_perma_name(row[0])
#   company = Company.find_or_create_by_url(row[5])
#   person = Person.create!(name: "#{row[1]} #{row[2]}", company_id: company.id)
#   Attendance.create!(event_id: event.id, role: row[3], attending_id: person.id, attending_type: 'Person')
# end

CSV.foreach("app/assets/data/attending_companies.csv") do |row|
  #event_perma;company_role;company_perma
  event = Event.find_or_create_by_perma_name(row[0])
  company = Company.find_or_create_by_company_perma(row[2])
  Attendance.create!(event_id: event.id, role: row[1], attending_id: company.id, attending_type: 'Company')
end
# 
# CSV.foreach("app/assets/data/person.csv") do |row|
#   #first_name,last_name,person_role,company_name,company_url
#   company = Company.find_or_create_by_url(row[4])
#   company.update_attributes(name: row[3])
#   person = Person.new(name: "#{row[0]} #{row[1]}")
#   person.company = company
#   person.save
#   Attendance.create!(event_id: event.id, role: row[2], attending_id: person.id, attending_type: 'Person')
# end