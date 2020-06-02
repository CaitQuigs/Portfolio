module ModalHelper
	def modal_name
		# Modal name for project #1 - project-1Modal. Label - project1-ModalLabel
		modal_name = `project-` + `#{self.id}` + `Modal`
		return modal_name
	end

	def modal_label
		modal_label = 'project-' + '#{self.id}' + 'ModalLabel'
		return modal_label
	end
end
