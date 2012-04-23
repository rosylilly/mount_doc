require 'spec_helper'

describe UsersController do
  describe "GET /users" do
    it "status code 200" do
      get '/users'
      response.status.should == 200
    end
  end
end
