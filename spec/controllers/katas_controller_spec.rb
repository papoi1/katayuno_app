require 'rails_helper'

describe KatasController do
  context 'when no user logged' do
    it 'edit path redirects' do

      get :new

      expect(response.code).to eq('302')
    end

  end
end
