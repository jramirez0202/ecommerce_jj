class Address < ApplicationRecord
  belongs_to :user, optional: true

  # validates :fullname, :street, :email, :number, :city, :comuna, presence: true
end
