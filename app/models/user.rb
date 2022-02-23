# frozen_string_literal: true

class User < ApplicationRecord
  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]
    find_by(email: email, password: password)
  end

  validates :name, :email, :password, presence: {:message => "Can't be blank." }
  validates :email, uniqueness: true
  validates :password, length: { in: 8..12 }

  # validates :title, 
  #         :presence => {:message => "Title can't be blank." },
  #         :uniqueness => {:message => "Title already exists."},
  #         :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
