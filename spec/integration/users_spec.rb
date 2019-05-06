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
  

     
  path '/users.json' do

    post 'Creates an users' do
      tags 'users'
      consumes 'application/json', 'application/xml'
      parameter name: :users, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          kind: { type: :string },
          priority: { type: :string },
          user_id: { type: :integer },
          assigned_user: { type: :integer },
          votesCount: { type: :integer },
          watchers: { type: :integer },
          status: { type: :string }
        },
        required: [ 'name', 'status' ]
      }

      response '201', 'user created' do
        let(:user) { { title: 'users 1', description: 'Prova users 1' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { title: 'foo' } }
        run_test!
      end
    end
  end

# path '/api/v1/pets/{id}' do
  path '/users/{id}.json' do

    get 'Retrieves a pet' do
      tags 'Pets'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            photo_url: { type: :string },
            status: { type: :string }
          },
          required: [ 'id', 'name', 'status' ]

        let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end