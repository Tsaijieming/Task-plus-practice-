class User < ApplicationRecord
  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]
    self.find_by(email: email, password: password)
  end
end
