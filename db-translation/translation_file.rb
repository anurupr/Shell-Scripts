require 'securerandom'

table "ulist" do
	column "﻿xcvd",  :key
	column "﻿bai",  :integer , :rename_to => "user_id"
	column "user_name", :string
	column "user_email", :string, :rename_to => 'email'
	column "user_password", :string, :rename_to => 'password'
	column "user_status_id", :integer
	column "user_country_id", :integer
	column "registartion_date", :datetime, :rename_to => 'createdAt'
	column "registration_ip", :string, :rename_to => 'regIP'
	column "cellphone_no", :string
	column "user_token", :string
	column "expiration_date", :datetime
	column "last_login_date", :datetime
	column "last_login_ip", :string, :rename_to => 'lastUsedIP'
	column "cell_code", :string
	column "adults_code", :string
	column "user_country_by_ip", :string
	column "server_id", :integer
	column "os_id", :integer
	column "user_hotlinks_attempts", :integer
	column "rec_server_id", :integer
	column "comments", :string
	column "user_country_iso", :string
	column "has_hd", :integer
	column "default_quality", :integer
	column "default_stretch", :integer
	column "volume_level", :integer
	column "redundency_server_id", :integer
	column "user_transaction", :integer
	column "has_smil", :integer
	column "user_sn", :integer
	column "user_integration_provider_id", :integer
	column "role", :string
	column "imported", :boolean
end
