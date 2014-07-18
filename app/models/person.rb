# == Schema Information
#
# Table name: people
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
#

class Person < ActiveRecord::Base
end
