require "typhoeus"
require "rspec"
require "vcr"
require "webmock"

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe "thing" do
  it "gets the expected title" do
    VCR.use_cassette('link') do
      url = "http://www.nytimes.com/2013/10/25/business/fda-seeks-tighter-control-on-prescriptions-for-class-of-painkillers.html"

      cookies = StringIO.new
      options = { followlocation: true, cookiejar: cookies, cookiefile: cookies }
      response = Typhoeus.get(url, options)

      expect(response.effective_url).to_not be_nil
    end
  end
end
