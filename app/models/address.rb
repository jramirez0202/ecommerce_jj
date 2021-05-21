class Address < ApplicationRecord
    belongs_to :user

    validates :FullName, :phone, :email, :street, :build, :place, :city, :comuna, presence: true
end
