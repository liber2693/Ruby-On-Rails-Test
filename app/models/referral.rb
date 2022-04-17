class Referral < ApplicationRecord
  before_create do
    self.code ||= SecureRandom.urlsafe_base64(3)
  end
end
