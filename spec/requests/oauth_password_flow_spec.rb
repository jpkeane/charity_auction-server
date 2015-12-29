RSpec.describe 'OAuth password flow', :type => :request do

  let :email_address do
    'testuser@testdomain.com'
  end

  let :password do
    'password123'
  end

  let! :user do
    FactoryGirl.create(:user, email_address: email_address, password: password)
  end

  it 'creates a token and returns it if credentials are valid' do
    post '/oauth/token', grant_type: 'password', username: email_address, password: password
    expect(response.status).to eq 200

    access_token = JSON.parse(response.body)['access_token']
    expect(access_token).not_to be_nil
  end

  it 'does not issue a token if the credentials are invalid' do
    post '/oauth/token', grant_type: 'password', username: email_address, password: 'bologna'
    expect(response.status).to eq 401
  end
end