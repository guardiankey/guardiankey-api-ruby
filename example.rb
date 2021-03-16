
require './guardiankey'

gk_conf = { "organization_id" => "",
            "authgroup_id"    => "",
            "key"             => "",
            "iv"              => "",
            "service"         => "MySystem",
            "agentId"         => "MyAgentId"
            }

gk = GuardianKey.new(gk_conf)

client_ip="1.1.1.1"
user_agent="Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"
username="test@test.com"
useremail=username
login_failed="0"

gk_return = gk.check_access(client_ip,user_agent,username,useremail,login_failed)

puts gk_return
