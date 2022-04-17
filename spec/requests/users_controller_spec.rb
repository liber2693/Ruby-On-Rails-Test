require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /create' do
    context 'the parameter username is not blank' do
      before do
        post '/users', params: { user: { name: 'Prueba' }}
      end

      it 'creates a new user' do
        expect(User.where(name: 'Prueba')).to be_present
      end

      it 'renders an empty response' do
        expect(response.body).to be_empty
      end

      it 'renders a response with status 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'the parameter username is blank' do
      before do
        post '/users', params: {'CONTENT_TYPE' => 'application/json', user: { name: '' }}
      end

      it 'does not create a new user' do
        expect(User.last).not_to be_a_new(User)
      end

      it 'content type' do
        expect(response.body).not_to be_empty
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end

      it 'renders a response with status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a json object {"errors": {"name": ["can\'t be blank"]}}' do
        expect(response.body).to eq '{"errors":{"name":["can\'t be blank"]}}'
      end
    end

  end
end
