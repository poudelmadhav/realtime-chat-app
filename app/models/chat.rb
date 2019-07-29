class Chat < ApplicationRecord
  after_create :notify_pusher, on: :create

  def notify_pusher
    Pusher.trigger('Chat', 'new', self.as_json)
  end
end
