class Providers::APanelProvider < PanelProvider
    include TimeComSupport

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

end