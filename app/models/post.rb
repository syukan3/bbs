class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}

  belongs_to :user, optional: true
  belongs_to :welcome, optional: true 
  belongs_to :room, optional: true

#  def user
#    return User.find_by(id: self.user_id)
#  end

end
