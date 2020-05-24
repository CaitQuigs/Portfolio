# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
	validates :tag_name, uniqueness: true

	has_many :project_tags
	has_many :projects, through: :project_tags

end
