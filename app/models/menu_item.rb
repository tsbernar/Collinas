class MenuItem < ActiveRecord::Base
	belongs_to :menu_section 

	def self.to_csv
		attributes = %w{id name description price}
		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |menu_item|
				csv << attributes.map{ |attr| menu_item[attr] }
			end
		end
	end

end