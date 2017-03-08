class Company < ActiveRecord::Base
  belongs_to :masteruser, class_name: 'User', foreign_key: :masteruserid, primary_key: :id
end
