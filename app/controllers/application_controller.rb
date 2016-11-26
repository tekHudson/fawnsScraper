class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'open-uri'
  require 'nokogiri'

  FAWN_STATS = [:fawn_id, :owner_name, :coat, :ears, :tail, :antlers, :eyes, :persona, :max_size, :age, :gender, :training, :fwn_points]

  def scrape_fawns

    data = {}
    stats = []
    fawn_id = "5831937b187ae"

    doc = Nokogiri::HTML(open("http://www.fawns.org/#{fawn_id}"))

    stats = doc.css('div')[2].css('b').map{ |ele| ele.next.text.strip  }

    FAWN_STATS.each_with_index { |stat, i| data[stat] = stats[i] }

    return data.to_s
  end
end
