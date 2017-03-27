class Sale < ActiveRecord::Base
	before_create :generate_guid
	belongs_to :mentor
	
	include AASM
	aasm column: 'state' do
	    state :sleeping, :initial => true
	    state :running, :completed
	    state :errored

	    event :running, after: :charge_card do
	    	transitions from: :sleeping, to: :running
    	end
    	
    	event :complete do
    		transitions from: :running, to: :completed
		end

		event :fail do
			transitions from: :running, to: :errored
		end

	end
	def charge_card
		begin
			save!
			charge = Stripe::Charge.create(
				amount: self.amount,
				currency: "gbp",
				card: self.stripe_token,
				description: "Schedule a Call with Mentor"
				)
			self.update(stripe_id: charge.id)
			self.complete!

		rescue Stripe::StripeError => e
			self.update_attributes(error: e.message)
			self.fail!	
		end

	end

	private
		def generate_guid
			self.guid = SecureRandom.uuid()
		end
end
