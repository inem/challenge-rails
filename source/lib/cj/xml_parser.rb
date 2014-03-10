require 'nokogiri'
module CJ
  class XmlParser
    def initialize(xml, &block)
      doc = Nokogiri::XML(xml)
      doc.xpath('//cj-api/links/link').each do |node|
        yield node
      end
    end

    def self.get_value(node, name)
      if element = node.xpath(name).children.first
        element.content
      else
        nil
      end
    end
  end
end