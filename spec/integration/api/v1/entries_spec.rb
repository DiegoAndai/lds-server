require 'swagger_helper'

describe 'API V1 Entries', swagger_doc: 'v1/swagger.json' do
  path '/entries' do
    get 'Retrieves Entries' do
      description 'Retrieves all the entries'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:entry, collection_count) }

      response '200', 'Entries retrieved' do
        schema('$ref' => '#/definitions/entries_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Entry' do
      description 'Creates Entry'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :entry, in: :body)

      response '201', 'entry created' do
        let(:entry) do
          {
            concept: 'Some concept'
          }
        end

        run_test!
      end

      response '400', 'invalid attributes' do
        let(:entry) do
          {
            concept: nil
          }
        end

        run_test!
      end
    end
  end

  path '/entries/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_entry) { create(:entry) }
    let(:id) { existent_entry.id }

    get 'Retrieves Entry' do
      produces 'application/json'

      response '200', 'entry retrieved' do
        schema('$ref' => '#/definitions/entry_resource')

        run_test!
      end

      response '404', 'invalid entry id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Entry' do
      description 'Updates Entry'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :entry, in: :body)

      response '200', 'entry updated' do
        let(:entry) do
          {
            concept: 'Some concept'
          }
        end

        run_test!
      end

      response '400', 'invalid attributes' do
        let(:entry) do
          {
            concept: nil
          }
        end

        run_test!
      end
    end

    delete 'Deletes Entry' do
      produces 'application/json'
      description 'Deletes specific entry'

      response '204', 'entry deleted' do
        run_test!
      end

      response '404', 'entry not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
