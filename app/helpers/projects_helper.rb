module ProjectsHelper
	# setup_tags should take a tag submitted on the project form and search the tags table. If there is a matching tag, add a Project_Tag. If there is no matching tag, add a Tag and a Project_tag

	def setup_tags(tag_entered)
		tag_entered = Tag.find_by(tag_entered.downcase)
		unless tag_entered
			tag_entered = Tag.create(tag_name: tag_entered)
		end
		project_tag = ProjectTag.create(project_id: project.id, tag_id: tag_entered.id)
	end
end
