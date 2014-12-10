class ApplicationController < ActionController::Base
  class Action < ApplicationController
    include FocusedController::Mixin
  end
end
