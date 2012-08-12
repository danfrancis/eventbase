require 'csv'

Event.destroy_all
Venue.destroy_all
Person.destroy_all
Sector.destroy_all
Company.destroy_all

venue = Venue.create!(address: '16 Lower Thames Street London, UK EC3R 6DX', city: 'London', country: 'United Kingdom', name: 'Old Billingsgate')

event = Event.create!(description: "Since its launch in 2009, the NOAH Conference has grown into the preeminent European event where Internet CEOs, executives and investors gain deep insights into the latest proven concepts, network with senior executives and establish new business relationships, while also enjoying one of the best Internet business networking dinner parties of the year. While the conference is widely recognized for its in depth analysis of Internet businesses and trends, the event is ultimately an opportunity for participants to interact with speakers, be inspired, and have fun.",
                      event_end_date: Date.new(2011,11,10), event_start_date: Date.new(2011,11,9), 
                      name: 'Noah Conference London 2012',
                      venue_id: venue.id)

sectors = ['Internet', 'Technology']
sectors.each do |sector|
  sector_record = Sector.create!(name: sector)
  Tag.create!(sector_id: sector_record.id, taggable_id: event.id, taggable_type: 'Event')
end
CSV.foreach("app/assets/data/person.csv") do |row|
  #first_name,last_name,person_role,company_name,company_url
  company = Company.find_or_create_by_url(row[4])
  company.update_attributes(name: row[3])
  person = Person.new(name: "#{row[0]} #{row[1]}")
  person.company = company
  person.save
  Attendance.create!(event_id: event.id, role: row[2], attending_id: person.id, attending_type: 'Person')
end


                      





