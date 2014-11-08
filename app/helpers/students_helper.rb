module StudentsHelper

	def price_helper(amount)
		amount.to_i / 100
	end
end