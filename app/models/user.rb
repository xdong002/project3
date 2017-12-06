class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: {minimum: 3}
  has_secure_password
  has_many :topics

  def self.confirm(params)
    @user = User.find_by({username: params[:username]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
