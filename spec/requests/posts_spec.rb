require 'rails_helper'

RSpec.describe 'Post API', type: :request do
  # add posts owner
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, created_by: user.id) }
  let(:post_id) { posts.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /posts' do
    # update request with headers
    before { get '/posts', params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id' do
    before { get "/posts/#{post_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  describe 'POST /posts' do
    let(:valid_attributes) do
      # send json payload
      { title: 'Learn Elm', subtitle: 'a' * 40, body: 'a' * 300, created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/posts', params: valid_attributes, headers: headers }

      it 'creates a post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/posts', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
            .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /posts/:id' do
    let(:valid_attributes) { { title: 'Shopping', subtitle: 'a' * 40, body: 'a' * 300 }.to_json }

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end