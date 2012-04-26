require 'spec_helper'

describe MountDoc::MountDocController do
  describe 'GET /doc' do
    before { get '/doc' }
    it "status code 200" do
      response.should be_success
      response.status.should == 200
    end

    it "rendered README" do
      response.body.should include('README')
      response.body.should include(GitHub::Markup.render(File.join(
        Rails.root,
        'README.rdoc'
      )))
    end
  end

  describe "GET /doc/files/README_FOR_APP" do
    before { get '/doc/files/README_FOR_APP' }
    it "status code 200" do
      response.should be_success
      response.status.should == 200
    end

    it "renderd doc/README_FOR_APP" do
      response.body.should include(GitHub::Markup.render(File.join(
        Rails.root,
        'doc/README_FOR_APP'
      )))
    end
  end
end
