class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  concerning :Errors do
    #
    # Renders a JSON error with a HTTP status code defined by status
    # For a list of valid Rails/HTTP statuses see:
    # http://guides.rubyonrails.org/layouts_and_rendering.html#the-status-option
    #
    # Example:
    #
    # api_error :unauthorized, 'You are not authorized to do this.'
    #
    private def api_error(status, message)
      render status: status,
             json: { error: status, error_description: message }
    end

    private def invalid_resource_error(resource)
      message = resource.errors.full_messages.to_sentence
      api_error :unprocessable_entity, message
    end

    private def record_not_found_error
      api_error :not_found, 'record not found'
    end

    private def not_authorized_error
      api_error :unauthorized, 'not aunthorized'
    end

    private def service_error
      api_error :service_unavailable, 'service error'
    end
  end
end