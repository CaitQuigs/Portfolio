# == Schema Information
#
# Table name: contacts
#
#  id                :bigint           not null, primary key
#  name              :string
#  company           :string
#  email             :string
#  phone             :string
#  method_of_contact :integer
#  work_description  :text
#  industry          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_log       :text             default([]), is an Array
#  update_log        :text             default([]), is an Array
#
require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
