class Providers::APanelProvider < PanelProvider
    def calculate_price
        fetch_data
        a_counter = 0
        body = Nokogiri::HTML(@response.body)
        body.css('head').remove
        body.xpath("//script").remove
        body.xpath('//comment').remove
        body.xpath('//@style').remove

        body.traverse do |node|
            text = node.text
            a_counter += text.count('a') if text
        end
        a_counter / 100
    end

    private
    def fetch_data
        uri = URI.parse("http://time.com")
		http = Net::HTTP.new(uri.host, uri.port)
		@response = http.get(uri.request_uri)
    rescue Net::OpenTimeout
        raise Timeout::Error, 'Could not connect to remote host'
    end

end