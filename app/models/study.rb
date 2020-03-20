# == Schema Information
#
# Table name: studies
#
#  id           :integer          not null, primary key
#  day          :date
#  diary        :text
#  english      :integer
#  game         :integer
#  japanese     :integer
#  math         :integer
#  other_study  :integer
#  point        :integer
#  science      :integer
#  social_study :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Study < ApplicationRecord
end
