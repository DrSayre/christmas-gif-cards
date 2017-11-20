class CardMailer < ApplicationMailer
  default from: "caleb@christmasgifcards.com"

  def card_sent(sender)
    @sender = sender
    @card = sender.cards.first
    mail(to: 'DrSayre2002@yahoo.com', subject: 'Christmas GIF Card Sent')
  end

  def thank_you(sender)
    @sender = sender
    @recipiant = sender.cards.first.name
    mail(to: sender.email, subject: 'Thank You')
  end
end
