class GuardianKeyRequest
  def self.post(uri, payload)
    api_base_uri = URI.parse('https://api.guardiankey.io')
    http = Net::HTTP.new(api_base_uri.host, api_base_uri.port)
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')

    if api_base_uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end

    request.body = payload
    http.request(request)
  end
end
