module ApplicationHelper
	def title param
		content_for(:title, param)
	end
end
