# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ImportersController, type: :controller do
  describe 'POST #create' do
    let(:file) { fixture_file_upload('public/log/file.log', 'text/csv') }
    let(:params) { { import: { file: file } } }

    subject { post :create, params: params }

    context 'when the file is present' do
      it 'returns status 200 and the expected JSON response' do
        subject
        expect(response).to have_http_status(:ok)

        game_two_summary = JSON.parse(response.body).first[1]['attributes']['result']['game_2']
        expect(game_two_summary).to include(
          'total_kills' => 11,
          'players' => %w[Isgalamido Mocinha],
          'kills' => {
            'Isgalamido' => 3,
            'Mocinha' => 0
          },
          'kills_by_means' => {
            'MOD_ROCKET_SPLASH' => 3
          }
        )
      end
    end

    context 'when the file is not present' do
      let(:params) { { import: { file: nil } } }

      it 'returns status 422 and an error message' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
