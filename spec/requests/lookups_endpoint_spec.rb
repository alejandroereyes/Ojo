describe 'Lookups Endpoint' do
  # TODO: unhappy paths

  describe 'show' do
    let(:og_url) { 'https://og_url.com' }
    let(:short_code) { 'a' }
    let(:url) { Url.new(original_url: og_url, short_code: short_code) }

    before do
      allow(Url).to receive(:find_by).with(short_code: short_code).and_return(url)
    end

    it 'redirects to original url' do
      get "/m/#{short_code}"

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(og_url)
    end
  end
end
