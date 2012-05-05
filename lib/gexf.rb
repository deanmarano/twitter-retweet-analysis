require 'builder'

class GexfExport
  def self.export(filename)
    file = File.new filename, 'w'
    xml = Builder::XmlMarkup.new( target: file, indent: 2)
    xml.instruct! :xml, version: "1.0", encoding: "UTF=8"
    xml.gefx xmlns: "http://www.gexf.net/1.2draft", version: "1.2" do |gefx|
      gefx.meta lastmodifieddate: DateTime.now do |meta|
        meta.creator "Dean Marano"
        meta.description "A sample of Twitter retweeting."
      end
      gefx.graph mode: 'static', defaultedgetype: 'directed' do |graph|
        graph.nodes do |nodes|
          nodes.node id: "0", label: "Hello"
          nodes.node id: "1", label: "World"

        end
        graph.edges do |edges|
          edges.edge id: "1", source: "0", target: "1"
        end
      end
    end
    file.close
  end

end
