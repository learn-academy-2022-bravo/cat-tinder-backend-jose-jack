require 'rails_helper'

RSpec.describe "Reptiles", type: :request do
  describe "GET /index" do
    it "gets a list of reptiles" do
      Reptile.create(
        name: 'Fred',
        age: 5,
        enjoys: 'Eating bugs',
        image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
      )

      get '/reptiles'

      reptile = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(reptile.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a reptile" do
      reptile_params = {
        reptile: {
          name: 'Fred',
          age: 5,
          enjoys: 'Eating bugs',
          image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
        }
      }

      post '/reptiles', params: reptile_params

      expect(response).to have_http_status(200)
      reptile = Reptile.first
      expect(reptile.name).to eq 'Fred'
    end
  end

  describe "PATCH /update" do
    it 'can update an existing reptile' do
      reptile_params = {
        reptile: {
          name: 'Fred',
          age: 5,
          enjoys: 'Eating bugs',
          image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
        }
      }

      post '/reptiles', params: reptile_params
      reptile = Reptile.first

      update_reptile_params = {
        reptile: {
          name: 'Fred',
          age: 5,
          enjoys: 'Laying on a rock',
          image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
        }
      }
      patch "/reptiles/#{reptile.id}", params: update_reptile_params
      updated_reptile = Reptile.find(reptile.id)
      expect(response).to have_http_status(200)
      expect(updated_reptile.age).to eq(5)
    end
  end

  describe "DELETE /destroy" do
    it 'can delete an existing reptile' do
      reptile_params = {
        reptile: {
          name: 'Fred',
          age: 5,
          enjoys: 'Eating bugs',
          image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
        }
      }

      post '/reptiles', params: reptile_params
      reptile = Reptile.first
      
      delete "/reptiles/#{reptile.id}", params: reptile_params
      expect(Reptile.find_by(id: reptile.id)).to be_nil
      expect(response).to have_http_status(200)
    end
  end
end

