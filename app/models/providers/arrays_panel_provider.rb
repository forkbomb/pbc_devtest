require 'array'
require 'hash'

class Providers::ArraysPanelProvider < PanelProvider
    include DownloadableSupport

    def calculate_price
        fetch_data('http://openlibrary.org/search.json?q=the+lord+of+the+rings')
        data = JSON.parse(@response.body)
        array_count = 0
        data.iterate_recursively do |obj|
            array_count += 1 if obj.size > 10
        end
        array_count
    end

end