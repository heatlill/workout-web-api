require 'rubygems'
require 'json'
require 'net/http'

def news_search(query, results=10, start=1)
    base_url = "http://www.google.com/search?q=json"
    url = "#{base_url}"
    #&query=#{URI.encode(query)}&results=#{results}&start=#{start}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    # we convert the returned JSON data to native Ruby
    # data structure - a hash
    result = JSON.parse(data)
    puts result
    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
        raise "web service error"
    end
    return result
end
