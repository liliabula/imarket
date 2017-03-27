class Sale < ActiveRecord::Base
	before_create :generate_guid
	belongs_to :mentor

	private
		def generate_guid
			self.guid = SecureRandom.uuid()
		end
end
