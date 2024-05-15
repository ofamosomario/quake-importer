# frozen_string_literal: true

# ApplicationService
class ApplicationService
  def self.call(param)
    new(param).call
  end
end
