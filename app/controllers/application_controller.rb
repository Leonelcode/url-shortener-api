class ApplicationController < ActionController::API
  include Api::V1::Concerns::Response
  include Api::V1::Concerns::ExceptionHandler
end
