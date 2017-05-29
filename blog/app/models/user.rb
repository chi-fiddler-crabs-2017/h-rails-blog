class User < ActiveRecord::Base

  has_many  :posts

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :username,  presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(params = {}) # sending in data as a hash
    @user = self.find_by(email: params[:email])

      if @user && @user.password == params[:password]
        @user
      else
        nil
      end
    end
  end
end
