class ApplicationController < ActionController::Base

  class Action < ApplicationController
    include FocusedController::Mixin
    protect_from_forgery with: :exception
    include SessionsHelper
  end
end
