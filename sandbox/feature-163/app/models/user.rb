class User < ActiveRecord::Base
  belongs_to :company, inverse_of: :users
end
