class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username,  default: ''
			t.string :email, default: ''
			t.string :encrypted_password, default: ''
			t.string :salt, default: ''
			t.integer   :login_count, default: 0, null: false
			t.integer   :failed_login_count, default: 0, null: false
			t.timestamps null: false
		end
	end
end
