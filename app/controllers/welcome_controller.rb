# frozen_string_literal: true

# ImporterController
class WelcomeController < ApplicationController
  include ActionView::Layouts
  include ActionController::Rendering

  def index
    render 'index'
  end
end
