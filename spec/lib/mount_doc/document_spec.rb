require 'spec_helper'

describe MountDoc::Document do
  describe "initialize from file" do
    it "controller" do
      doc = MountDoc::Document.new(:controller, "api::documents")

      doc.doc_object.name.should == :DocumentsController
    end

    it "model" do
      doc = MountDoc::Document.new(:model, "api::document")

      doc.doc_object.name.should == :Document
    end
  end
end
