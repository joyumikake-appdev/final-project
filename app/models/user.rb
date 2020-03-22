# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  is_parent       :boolean
#  password_digest :string
#  total_points    :integer
#  user_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates :user_name, :presence => true
  validates :user_name, :uniqueness => true

  has_many :study_records, :class_name => "Study", :dependent => :destroy
  has_many :messages, :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy
  has_many :parents, :class_name => "Parenting", :foreign_key => "kid_id", :dependent => :destroy
  has_many :kids, :class_name => "Parenting", :foreign_key => "parent_id", :dependent => :destroy

  def own_studies
    return Study.where({ :user_id => self.id })
  end

  def points
    return Study.where({ :user_id => self.id }).sum("point")
  end

  def own_comments
    the_studies = Study.where({ :user_id => self.id }).pluck(:id)
    return Comment.where({ :study_id => the_studies})
  end

end