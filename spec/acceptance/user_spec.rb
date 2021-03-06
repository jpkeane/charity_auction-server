require 'rspec_api_documentation_helper'

RSpec.resource 'Users' do
  header 'Content-Type', 'application/vnd.api+json'

  shared_context 'user parameters' do
    parameter 'type', <<-DESC, required: true
      The type of the resource. Must be users.
    DESC
    let 'type' do
      'users'
    end
    parameter 'name', <<-DESC, scope: :attributes, required: true
      The name of the user.
    DESC
    parameter 'mobile-phone-number', <<-DESC, scope: :attributes, required: true
      The mobile phone of the user.
    DESC
    parameter 'email-address', <<-DESC, scope: :attributes, required: true
      The email address of the user.
    DESC
    parameter 'password', <<-DESC, scope: :attributes, required: true
      The password for the user.
    DESC
    parameter 'physical-address', <<-DESC, scope: :attributes, required: true
      The physical address of the user.
    DESC
  end

  post '/v1/users' do
    include_context 'user parameters'

    let 'name' do
      'Sean Devine'
    end

    let 'mobile-phone-number' do
      '+18885551212'
    end

    let 'email-address' do
      'barelyknown@icloud.com'
    end

    let 'password' do
      '12345678'
    end

    let 'physical-address' do
      "123 Main St\nAnytown, NY 12312 USA"
    end

    example_request 'POST /v1/users' do
      expect(status).to eq 201
      user = JSON.parse(response_body)
      expect(user['data']['attributes']['email-address']).to eq send('email-address')
    end
  end
end