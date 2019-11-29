class BuyDecorator < ApplicationDecorator
  delegate_all

  def client
    object.user.username
  end

  def date
    object.created_at.strftime("%A, %B %e")
  end
end
