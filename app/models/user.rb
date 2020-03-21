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

  def own_studies
    return Study.where({ :user_id => self.id })
  end

  def points
    return Study.where({:user_id => self.id }).sum("point")
  end
end