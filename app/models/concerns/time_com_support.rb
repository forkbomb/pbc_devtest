module TimeComSupport
    private
    def fetch_data
        uri = URI.parse("http://time.com")
		http = Net::HTTP.new(uri.host, uri.port)
		@response = http.get(uri.request_uri)
    rescue Net::OpenTimeout
        raise Timeout::Error, 'Could not connect to remote host'
    end
end