require 'swagger_helper'

describe 'IsuueTracker API' do


path '/comments.json' do

    get 'get comments' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'

      response '201', 'issue created' do
        let(:comments) { { text: 'Comment 1', issue_id: '1' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comments) { { text: 'Comment 1' } }
        run_test!
      end
      
    end
  end
  
    path '/comments/.json' do

    post 'create issue' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
            text: { type: :string },
            issue_id: { type: :integer },
            user_id: { type: :integer }
        },
        required: [ 'id', 'text', 'issue_id', 'user_id']
      }
      
      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            text: { type: :string },
            issue_id: { type: :integer },
            user_id: { type: :integer },
            created_at: { type: :datetime },
            updated_at: { type: :datetime }
          },
          required: [ 'id' ]

        let(:id) { Comment.create(id: 100, text: 'comment 100', issue_id: 1, user_id: 1) }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
  
  
  
end
     
#   path '/issues.json' do

#     post 'Creates an Issue' do
#       tags 'Issues'
#       consumes 'application/json', 'application/xml'
#       parameter name: :issue, in: :body, schema: {
#         type: :object,
#         properties: {
#           title: { type: :string },
#           description: { type: :string },
#           kind: { type: :string },
#           priority: { type: :string },
#           user_id: { type: :integer },
#           assigned_user: { type: :integer },
#           votesCount: { type: :integer },
#           watchers: { type: :integer },
#           status: { type: :string }
#         },
#         required: [ 'name', 'status' ]
#       }

#       response '201', 'issue created' do
#         let(:issue) { { title: 'Issue 1', description: 'Prova issue 1' } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:issue) { { title: 'foo' } }
#         run_test!
#       end
#     end
#   end

# # path '/api/v1/pets/{id}' do
#   path '/issues/{id}.json' do

#     get 'Retrieves a pet' do
#       tags 'Pets'
#       produces 'application/json', 'application/xml'
#       parameter name: :id, :in => :path, :type => :string

#       response '200', 'name found' do
#         schema type: :object,
#           properties: {
#             id: { type: :integer, },
#             name: { type: :string },
#             photo_url: { type: :string },
#             status: { type: :string }
#           },
#           required: [ 'id', 'name', 'status' ]

#         let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
#         run_test!
#       end

#       response '404', 'pet not found' do
#         let(:id) { 'invalid' }
#         run_test!
#       end
#     end
#   end
# end