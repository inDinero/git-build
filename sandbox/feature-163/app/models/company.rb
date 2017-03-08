class Company < ActiveRecord::Base
  has_many :users, inverse_of: :company
end
