module MessagesController
  class Action < ApplicationController::Action
    expose(:current_user_id) { current_user.id.to_s }
  end

  class Create < Action
    expose(:message) { Message.create(message_params) }

    def message_params
      params.require(:message).permit(:message, :thread_id, :user_id)
    end

    def call
      @message = message
      respond_to do |format|
        message.save
        format.js
      end
    end
  end
end