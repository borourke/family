module ThreadsController
  class Action < ApplicationController::Action
    expose(:current_user_id) { current_user.id.to_s }
  end

  class Index < Action
    expose(:threads) { users_threads(Threads.all.order(created_at: :desc)) }
    expose(:messages) { group_messages(Message.where(thread_id: thread_ids).order(created_at: :desc)).values }
    expose(:message) { Message.new }
    expose(:thread) { Threads.new }

    def users_threads(threads)
      threads.each_with_object([]) do |thread, keep|
        keep << thread if thread.users.include? (current_user_id)
      end
    end

    def thread_ids
      threads.each_with_object([]) do |thread, id_array|
        id_array << thread.id
      end
    end

    def group_messages(messages)
      messages.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |message, group|
        group[message.thread_id] << message
      end
    end

    def call
    end

  end

  class Create < Action
    expose(:thread) { Threads.create(thread_params) }
    expose(:message) { Message.create(message_params) }

    def thread_params
      params[:threads][:users].reject! { |u| u.empty? }
      params.require(:threads).permit(:title, :first_message, :users => [])
    end

    def message_params
      { 
        user_id: current_user_id, 
        message: params[:threads][:first_message],
        thread_id: thread.id
      }
    end

    def call
      thread.save
      message.save
      redirect_to :back
    end
  end
end