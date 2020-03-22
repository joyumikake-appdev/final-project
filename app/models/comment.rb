# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  study_id   :integer
#

class Comment < ApplicationRecord
  def commenter
    return User.where({ :id => self.author_id }).at(0)
  end

  def commented
    the_study = Study.where({ :id => self.study_id}).at(0)
    the_user_id = the_study.user_id
    return User.where({ :id => the_user_id}).at(0)
  end

  def User.own_comments
    the_studies = Study.where({ :user_id => self.id }).pluck(:id)
    return Comment.where({ :study_id => the_studies})
  end
end
