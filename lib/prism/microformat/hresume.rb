module Prism
  module Microformat
    class HResume
      FRIENDLY_NAME = "hResume"
      NAME          = "hresume"
      WIKI_URL      = "http://microformats.org/wiki/hResume"
      XMDP          = 'http://microformats.org/profile/hresume'

      def self.parse(doc)
        return nil if doc.css(".#{NAME}").nil?
        roots = doc.css(".#{NAME}")
        roots.size == 1 ? HResume.new(doc) : roots.collect { |root| HResume.new(root) }
      end

      def initialize(doc)
        @root        = doc
        @experiences = []
      end

      def name
        first_name = remove_newlines(@root.css(".given-name").text)
        last_name  = remove_newlines(@root.css(".family-name").text)
        first_name + " " + last_name
      end

      def current_title
        title = remove_newlines(@root.css(".profile-header .title").text)
        title
      end

      def demographic
        locality = remove_newlines(@root.css("#headline .locality").text)
        locality
      end

      def overview_summary
        current   = get_content('//dd[contains(@class,"summary-current")]/ul/li', @root)
        past      = get_content('//dd[contains(@class, "summary-past")]/ul/li', @root)
        more_past = get_content('//dd[contains(@class,"summary-past")]/div[@id="morepast"]/ul/li', @root)
        current + past + more_past
      end

      def profile_summary
        profile_summary = get_content('//div[@id="profile-summary"]/div[contains(@class,"content")]', @root)
        profile_summary[0]
      end

      def get_content(xpath_expression, doc)
        content_array = Array.new
        nodeset       = doc.xpath(xpath_expression)
        nodeset.each do |node|
          content = ""
          content += node.content
          content.gsub!(/\n\s+/, " ")
          content.strip!
          content_array.push(content)
        end
        content_array
      end

      def remove_newlines(text)
        text.gsub!(/\n\s+/, " ")
        text.strip!
        text
      end

      def get_calendar(node, css)
        calendar              = Hash.new
        period                = node.css(css);
        calendar['start']     = period.css('.dtstart').text
        calendar['end']       = period.css('.dtend').text
        calendar['timestamp'] = period.css('.dtstamp').text
        calendar['duration']  = period.css('.duration').text
        calendar
      end

      def positions
        positions ||= []

        @root.css("#profile-experience .position").each do |position_node|
          position             = Position.new
          position.title       = remove_newlines(position_node.css('span.title').text)
          position.org         = remove_newlines(position_node.css('span.summary').text)
          position.description = remove_newlines(position_node.css('p.desc').text)
          position.calendar    = get_calendar(position_node, "p.period")
          positions << position
        end
        positions
      end

      def education
        education ||= []

        @root.css("#profile-education .position").each do |position_node|
          edu             = Education.new
          edu.institution       = remove_newlines(position_node.css('h3.summary').text)
          edu.degree         = remove_newlines(position_node.css('span.degree').text)
          edu.major = remove_newlines(position_node.css('span.major').text)
          edu.description = remove_newlines(position_node.css('p.desc').text)
          edu.calendar    = get_calendar(position_node, "p.period")
          education << edu
        end
        education
      end


    end

    class Position < Struct.new(:title, :calendar, :org, :description)
      end
    class Education < Struct.new(:institution, :degree, :major, :description,:calendar)
    end

  end
end



