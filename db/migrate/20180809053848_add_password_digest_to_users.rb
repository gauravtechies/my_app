class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column("users", "password_digest", :string,:after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
