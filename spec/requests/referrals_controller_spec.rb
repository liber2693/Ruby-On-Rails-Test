require 'rails_helper'

RSpec.describe "Referrals", type: :request do
  describe 'POST /create' do
    context 'sends a mail to the passed email parameter' do
      before do
        post '/referrals', params: { email: 'liber2693@gmail.com' }
      end

      it 'status 200' do
        expect(response).to have_http_status(:success)
      end

      it 'send a mail to the passed email parameter' do
        expect(response.body).to include('www.codility.com/referrals/#{@referral.code}')
        #mail.body.encoded
      end

    end
  end
end
