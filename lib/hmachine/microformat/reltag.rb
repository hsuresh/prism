module HMachine
  module Microformat
    class RelTag < Base
      
      wiki_url "http://microformats.org/wiki/rel-tag"
      
      xmdp 'http://microformats.org/profile/rel-tag'
      
      search {|doc| doc.css('a[rel~="tag"]') }
      
      validate {|a| a['rel'] && a['rel'].split(' ').include?('tag') }
      
      invalid_msg "This is not a Rel-Tag Microformat"
      
      def tag
        @tag ||= { node['href'].split('/').last => node['href'] }
      end
      
      def name
        tag.keys.to_s
      end
      
      def to_s
        name
      end
      
      def url
        tag.values.to_s
      end
      
      def to_h
        tag
      end
      
    end
  end
end