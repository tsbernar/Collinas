class MenuItem < ActiveRecord::Base
	belongs_to :menu_section 

	def self.to_csv
		attributes = %w{id name description price section}
		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |menu_item|
				csv << attributes.map{ |attr| menu_item[attr] }
			end
		end
	end

	def self.import(file)
		counter = 0
		CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
			menu_item = MenuItem.assign_from_row(row)
			if menu_item.save
				counter += 1
			else
				puts "#{menu_item.name} - #{menu_item.errors.full_messages.join(",")} "
			end
			counter
		end
	end

	def self.assign_from_row(row)
			menu_item = MenuItem.where(name: row[:name]).first_or_initialize 
			menu_item.assign_attributes row.to_hash.slice(:description, :price, :section)
			menu_item
	end

end