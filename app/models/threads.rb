class Threads < ActiveRecord::Base
  serialize :users, Array
  has_many :messages
end