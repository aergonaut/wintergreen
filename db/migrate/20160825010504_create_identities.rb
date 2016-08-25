class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")

    create_table :identities, id: :uuid, default: "gen_random_uuid()" do |t|
      t.references :user, type: :uuid, index: true
      t.string :provider
      t.string :uid
      t.string :encrypted_access_key
      t.string :encrypted_access_key_iv

      t.timestamps
    end
  end
end
