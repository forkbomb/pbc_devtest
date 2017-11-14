require 'net/http'

module DownloadableSupport
    private
    def fetch_data(address)
        uri = URI.parse(address)
		http = Net::HTTP.new(uri.host, uri.port)
		@response = http.get(uri.request_uri)
    rescue Net::OpenTimeout
        raise Timeout::Error, 'Could not connect to remote host'
    end
end