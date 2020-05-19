# == Schema Information
#
# Table name: project_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_project_tags_on_project_id  (project_id)
#  index_project_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (tag_id => tags.id)
#
class ProjectTag < ApplicationRecord
  belongs_to :project
  belongs_to :tag

  accepts_nested_attributes_for :tag
end
