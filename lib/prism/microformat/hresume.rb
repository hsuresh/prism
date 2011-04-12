module Prism
  module Microformat
    class HResume
      FRIENDLY_NAME = "hResume"
      NAME = "hresume"
      WIKI_URL = "http://microformats.org/wiki/hResume"
      XMDP = 'http://microformats.org/profile/hresume'

      def self.parse(doc)
        return nil if doc.css(".#{NAME}").nil?
        roots = doc.css(".#{NAME}")
        roots.size == 1 ? HResume.new(doc) : roots.collect{|root|  HResume.new(root) }
      end

      def initialize(doc)
        @root = doc
        @experiences = []
      end

      def summary
        @root.css("#profile-summary > .content").text.strip.split("\n").reject{|s| s.strip.empty?}.join("\n")
      end

      def positions
        positions ||= []
        vevents = Prism::Microformat::HCalendar.parse(@root.css("#profile-experience"))
        @root.css("#profile-experience .position").each_with_index do |positionNode, i|
          position = Position.new
          position.title = positionNode.css(".title").text
          position.org = positionNode.css(".org").text
          position.vevent = vevents[i][:vevent][0]
          positions << position
        end
        positions
      end

      def educations
        educations = Prism::Microformat::HCalendar.parse(@root.css("#profile-education"))
        educations
      end
    end

    class Position < Struct.new(:title, :vevent, :org)
    end
    
  end
end
