class AddConfirmationmailToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :confirmation_token, :string
    add_column :hosts, :confirmed_at, :datetime
    add_column :hosts, :confirmation_sent_at, :datetime
    add_column :hosts, :unconfirmed_email, :string

    add_index :hosts, :confirmation_token,   unique: true
  end
end
