module ThreadsController
  class Action < ApplicationController::Action
  end

  class Index < Action
    expose(:threads) { users_threads(Threads.all) }
    expose(:thread) { Threads.new }

    def users_threads(threads)
      threads.each_with_object([]) do |thread, keep|
        keep << thread if thread.users.include? (current_user.id.to_s)
      end
    end

    def call
    end

  end

  class Create < Action
    expose(:thread) { Threads.create(thread_params) }

    def thread_params
      params[:threads][:users].reject! { |u| u.empty? }
      params.require(:threads).permit(:title, :first_message, :users => [])
    end

    def call
      thread.save
      redirect_to threads_path
    end
  end
end