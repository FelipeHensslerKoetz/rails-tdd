# frozen_string_literal: true

describe 'HTTParty' do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts' } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to eq('application/json; charset=utf-8')
  end
end
