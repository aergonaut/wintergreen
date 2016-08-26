class Identity < ApplicationRecord
  PROVIDERS = ["github"].freeze

  belongs_to :user

  validates :provider, presence: true, inclusion: { in: Identity::PROVIDERS }

  attr_encrypted :access_key, key: Rails.application.secrets.attr_encrypted_key_base
end
