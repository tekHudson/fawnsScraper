class Fawn < ApplicationRecord
  require 'open-uri'
  require 'nokogiri'
  self.primary_key = 'fawn_id'
  validates :fawn_id,
            :owner_name,
            :coat,
            :ears,
            :tail,
            :antlers,
            :eyes,
            :persona,
            :max_size,
            :age,
            :gender,
            :training,
            :fwn_points,
            presence: true
  validates :fawn_id, uniqueness: true

  FAWN_STATS = [:fawn_id, :owner_name, :coat, :ears, :tail, :antlers, :eyes, :persona, :max_size, :age, :gender, :training, :fwn_points]

  def self.build_attributes(fawn_id)
    data = {}
    stats = []

    stats = build_stats_array(fawn_id)

    FAWN_STATS.each_with_index { |stat, i| data[stat] = stats[i] }
    data
  end

  private

  def self.build_stats_array(fawn_id)
    puts fawn_id.inspect
    doc = Nokogiri::HTML(open("http://www.fawns.org/#{fawn_id}"))
    doc.css('div')[2].css('b').map{ |ele| ele.next.text.strip }
  end
end
