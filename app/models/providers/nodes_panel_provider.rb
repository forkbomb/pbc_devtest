class Providers::NodesPanelProvider < PanelProvider
    include DownloadableSupport

    def calculate_price
        fetch_data("http://time.com")
        nodes_count = 0
        body = Nokogiri::HTML(@response.body)
        body.xpath('//comment').remove
        body.traverse { nodes_count += 1 }
        nodes_count / 100
    end
end