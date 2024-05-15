# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ImportersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: api_v1_importers_path).to route_to(
        { format: :json, 'controller': 'api/v1/importers', 'action': 'create' }
      )
    end
  end
end
