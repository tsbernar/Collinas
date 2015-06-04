class Event < ActiveRecord::Base
	has_one :order

	def durring(time)
		if time > self.start and time < self.finish 
			true
		else
			false
		end
	end

	def self.taken(time)
		i = false
		Event.all.each do |event|
			if event.durring(time)
				i = true
			end
			puts i 
		end
	end

end
