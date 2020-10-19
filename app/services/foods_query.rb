class FoodsQuery
  def self.get_10_foods(ingredient)
    foods = []
    conn = Faraday.new(url: 'https://api.nal.usda.gov')
    response = conn.get("https://api.nal.usda.gov/fdc/v1/foods/search?query=#{ingredient}&api_key=#{ENV['FDC_key']}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:foods].each do |data|
      foods << CreateFood.new(data)
    end
    foods.unshift(json[:totalHits])
    foods[0..11]
  end
end
