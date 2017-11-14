class Hash
    def iterate_recursively(&block)
        self.class.iterate_recursively(self, &block)
    end


    def self.iterate_recursively(obj, &block)
        obj.each do |key, value|
            if value.is_a?(Hash)
                value.iterate_recursively(&block)
            elsif value.is_a?(Array)
                value.iterate_recursively(&block)
                yield value
            end
        end
    end
end