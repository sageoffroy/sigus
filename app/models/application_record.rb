module Functions

	def bool_to_s (bool_field)
		if bool_field
			'<i class="fa fa-check-squeare green"></i>'.html_safe
		else
			'<i class="fa fa-window-close red"></i>'.html_safe
		end
	end

end

class ApplicationRecord < ActiveRecord::Base

	include Functions

	self.abstract_class = true

end