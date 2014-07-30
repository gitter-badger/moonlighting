# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  bio          :text
#  location     :string(255)
#  phone_number :string(255)
#  country_code :string(255)
#  languages    :string(255)
#  birth_year   :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Profile < ActiveRecord::Base

  AVAILABILITY_OPTIONS= { "Looking for a job to start immediately." => 1,
                          "Employed but looking for a new challenge." => 2,
                          "Employed and happy but a nice opportunity might change my mind." => 3,
                          "Looking for freelancing jobs." => 4,
                          "Looking for moonlighting jobs." => 5 }

  belongs_to :user, dependent: :destroy

  validates :first_name,    presence: true, length: { maximum: 25 }
  validates :last_name,     presence: true, length: { maximum: 25 }
  validates :location,      presence: true, length: { maximum: 50 }
  validates :bio,           length: { maximum: 2000 }, on: :update
  validates :websites,      presence: true
#  validates :phone_number,  phony_plausible: {ignore_record_country_code: true}, on: :update


end
