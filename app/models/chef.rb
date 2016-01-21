class Chef < ActiveRecord::Base

  before_save { self.email = email.downcase }

  has_many :recipes

  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { minimum: 5, maximum: 30 },
                                    uniqueness: { case_sensitive:false }
  validates_format_of :email,:with => VALID_EMAIL_REGEX
end