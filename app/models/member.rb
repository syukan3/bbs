class Member < ApplicationRecord

  has_many :users, dependent: :destroy
  has_many :rooms

end
