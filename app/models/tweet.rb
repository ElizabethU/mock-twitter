class Tweet < ActiveRecord::Base
  validates_presence_of :user, :message
  validates             :message, length: { minumum: 1, maximum: 140 }
end
