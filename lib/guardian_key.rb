require 'json'
require 'digest'
require 'net/https'
require 'guardian_key/request'

class GuardianKey
  attr_reader :config

  def initialize(config)
    @config = config
  end

  def check_access(client_ip, user_agent, username, useremail, login_failed)
    event_json = event_params(client_ip, user_agent, username, useremail, login_failed).to_json
    hash       = Digest::SHA256.hexdigest("#{event_json}#{config[:key]}#{config[:iv]}")
    payload    = { 'id' => config[:auth_group_id], 'message' => event_json, 'hash' => hash }.to_json
    response   = GuardianKeyRequest.post('/v2/checkaccess', payload)

    JSON.parse(response.body) rescue { message: response.body }
  end

  private

  def event_params(client_ip, user_agent, username, useremail, login_failed)
    {
      'generatedTime' => Time.now.getutc.to_i,
      'agentId' => config[:agent_id],
      'organizationId' => config[:organization_id],
      'authGroupId' => config[:auth_group_id],
      'service' => config[:service],
      'clientIP' => client_ip,
      'clientReverse' => '',
      'userName' => username,
      'authMethod' => '',
      'loginFailed' => login_failed,
      'userAgent' => user_agent,
      'psychometricTyped' => '',
      'psychometricImage' => '',
      'event_type' => 'Authentication',
      'userEmail' => useremail
    }
  end
end
