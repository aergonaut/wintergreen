class Identity < ApplicationRecord
  belongs_to :user

  attr_encrypted :access_key
end
