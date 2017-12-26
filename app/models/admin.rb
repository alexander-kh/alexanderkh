class Admin < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: %r{\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z}i }
  validates :password, presence: true,
                       length: { in: 8..128 }
  has_secure_password
end
