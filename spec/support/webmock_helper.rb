module WebmockHelper

  def stub_all_webmocks
    stub_repos
  end

  def stub_response(json_file, url)
    json_file = File.open(json_file)
    stub_request(:get, "#{url}?access_token=abcdefg12345").to_return(status: 200, body: json_file, headers: {})
  end

end
