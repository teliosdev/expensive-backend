class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :email
      t.string :password_digest
    end

    add_index :users, :email, unique: true
  end
end
