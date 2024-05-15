# frozen_string_literal: true

module Api
  module V1
    # ImporterController
    class ImportersController < ApplicationController
      def create
        result = QuakeLogParserService.call(import_params['file'])

        if result
          render json: success_response(result), status: :ok
        else
          render json: error_response('Unable to import the file'), status: :unprocessable_entity
        end
      end

      private

      def import_params
        params.require(:import).permit(:file)
      end

      def success_response(result)
        {
          data: {
            type: 'import',
            attributes: {
              status: 'success',
              result: result
            }
          }
        }
      end

      def error_response(detail)
        {
          errors: [
            {
              status: '422',
              title: 'Import failed',
              detail: detail
            }
          ]
        }
      end
    end
  end
end
