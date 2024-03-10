class ApplicationController < ActionController::API
    def health_check
        if ActiveRecord::Base.connection.active?
          render json: { status: 'OK' }, status: :ok
        else
          render json: { error: 'Database connection is not active' }, status: :service_unavailable
        end
      end
end
