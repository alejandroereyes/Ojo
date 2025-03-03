describe 'Urls Endpoints' do
  # TODO: unhappy paths

  describe 'new' do
    it 'renders hotwired new template' do
      get '/urls/new'

      expect(response.body).to include('Enter your url')
      expect(response.body).to include("<turbo-frame id='urls'") # TODO: do better
    end
  end

  describe 'create' do
    let(:og_url) { 'https://og_url.com' }

    it 'creates a url' do
      post '/urls', params: { url: { original_url: og_url } }

      url = Url.first

      expect(url.original_url).to eq og_url
      expect(url.short_code).to be_present
    end
  end
end
