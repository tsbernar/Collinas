class MenuSection < ActiveRecord::Base
has_many :menu_items

	def self.to_csv_template
		headers = %w{name description price section}
		sections = []
		CSV.generate(headers: true) do |csv|
			all.each do |section|
				sections << section.name
			end
			headers << " "
			headers << "Hint: Use the following for 'section:' #{sections}. "
			csv << headers
		end
	end


end
