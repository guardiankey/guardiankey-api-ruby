require 'json'
require 'digest'
require 'net/http'

class GuardianKey

    def initialize(gk_conf)
        @gk_conf = gk_conf
        @api_url = "https://api.guardiankey.io/v2/checkaccess"
    end

    def create_event(client_ip,user_agent,username,useremail,login_failed)
        event = {   "generatedTime"    => Time.now.getutc.to_i,
                    "agentId"          => @gk_conf["agentId"],
                    "organizationId"   => @gk_conf["organization_id"],
                    "authGroupId"      => @gk_conf["authgroup_id"],
                    "service"          => @gk_conf["service"],
                    "clientIP"         => client_ip,
                    "clientReverse"    => "",
                    "userName"         => username,
                    "authMethod"       => "",
                    "loginFailed"      => login_failed,
                    "userAgent"        => user_agent,
                    "psychometricTyped"=> "",
                    "psychometricImage"=> "",
                    "event_type"       => "Authentication",
                    "userEmail"        => useremail
                }
        return event
    end

    def check_access(client_ip,user_agent,username,useremail,login_failed)
        event_str = self.create_event(client_ip,user_agent,username,useremail,login_failed).to_json
        hash      = Digest::SHA256.hexdigest event_str+@gk_conf["key"]+@gk_conf["iv"]
        jsonmsg   = {"id" => @gk_conf["authgroup_id"], "message" => event_str, "hash" => hash }.to_json
        uri  = URI(@api_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if uri.instance_of? URI::HTTPS
        req  = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
        req.body = jsonmsg
        res = http.request(req)
        return JSON.parse(res.body)
    end

end
