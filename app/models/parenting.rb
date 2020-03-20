# == Schema Information
#
# Table name: parentings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kid_id     :integer
#  parent_id  :integer
#

class Parenting < ApplicationRecord
end
