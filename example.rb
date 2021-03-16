
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
user_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36"
username="test@test.com"
useremail=username
login_failed="0"

gk_return = gk.check_access(client_ip,user_agent,username,useremail,login_failed)

puts gk_return
