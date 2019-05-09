require 'swagger_helper'

describe 'IsuueTracker API' do


path '/users.json' do

    get 'Get users' do
      tags 'users'
      consumes 'application/json', 'application/xml'

      response '201', 'users created' do
        let(:users) { { title: 'users 1', description: 'Prova users 1' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:users) { { title: 'foo' } }
        run_test!
      end
    end
  end
end