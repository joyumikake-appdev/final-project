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
  belongs_to :user
  has_many :messages, :class_name => "Comment", :dependent => :destroy

  validates :day, :presence => true
  validates :english, :presence => true
  validates :japanese, :presence => true
  validates :math, :presence => true
  validates :other_study, :presence => true
  validates :science, :presence => true
  validates :social_study, :presence => true
  validates :game, :presence => true
  
  def learner
    return User.where({ :id => self.user_id }).at(0)
  end
end
