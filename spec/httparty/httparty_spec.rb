# frozen_string_literal: true

describe 'HTTParty' do
  # it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
  # :record => :new_episodes
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', record: :new_episodes } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
    content_type = response.headers['content-type']
    expect(content_type).to eq('application/json; charset=utf-8')
  end
end
