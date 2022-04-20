# frozen_string_literal: true

describe 'HTTParty' do
  it 'HTTParty' do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2')
      .to_return(status: 200, body: '',
                 headers: { 'content-type': 'application/json; charset=utf-8' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to eq('application/json; charset=utf-8')
  end
end
