class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")

    create_table :users, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :login
      t.string :email

      t.timestamps
    end
  end
end
