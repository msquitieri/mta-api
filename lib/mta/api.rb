require 'httparty'

module MTA
  class API
    VERSION = '0.8.0'

    def initialize
    end

    def get_lost_property
      url = 'https://advisory.mtanyct.info/LPUWebServices/CurrentLostProperty.aspx'
      response = get(url)

      number_of_lost_articles = response.parsed_response['LostProperty']['NumberOfLostArticles']
      number_of_items_claimed = response.parsed_response['LostProperty']['NumberOfItemsclaimed']

      categories = response.parsed_response['LostProperty']['Category']

      items = categories.map do |category|
        category['SubCategory'].map do |sub_category|
          {
              name: sub_category['SubCategory'],
              count: sub_category['count'].to_i,
              category: category['Category']
          }
        end
      end

      items.flatten!

      json = {
          number_of_lost_articles: number_of_lost_articles.to_i,
          number_of_items_claimed: number_of_items_claimed.to_i,
          items: items
      }

      json
    end

    private

    def get(endpoint)
      HTTParty.get(endpoint)
    end
  end
end