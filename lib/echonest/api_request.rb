
module EchoNest
  class ApiRequest
  
    def initialize(resource, options)
      @options = {:api_key => EchoNest.api_key, :format => 'xml'}.merge(options)
      @resource = resource
    end
    
    def uri
      "http://developer.echonest.com/api/v4/#{@resource}?#{query_string(@options)}"
    end
    
    def fetch
      open(uri).read
    end
    
    private
    
    def query_string(options)
      options.keys.map { |key| "#{key.to_s}=#{URI.encode(options[key].to_s)}" }.join('&')
    end
  
  end

end
