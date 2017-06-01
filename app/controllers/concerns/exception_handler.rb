module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do

    ActionController::Parameters.action_on_unpermitted_parameters = :raise

    rescue_from ActionController::UnpermittedParameters do |e|
      render_json({ message: "Unpermitted parameters received: #{e.params}" }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      render_json({ message: "Required parameter missing: #{e.param}" }, :unprocessable_entity)
    end

    rescue_from ArgumentError do |e|
      render_json({ message: "Invalid parameter: #{e}" }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_json({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render_json({ message: e.message }, :unprocessable_entity)
    end
  end
end