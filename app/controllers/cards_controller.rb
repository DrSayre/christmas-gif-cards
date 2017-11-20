class CardsController < ApplicationController
  def new
    @sender = Sender.new
    @sender.cards.build
  end

  def create
    begin
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => 299,
        :description => 'christmasgifcards.com',
        :currency    => 'usd'
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to action: :new_card
    end
    @sender = Sender.new(sender_params)
    if @sender.save
      flash[:notice] = 'Thank you for your order! Your card will be in the mail soon.'
      CardMailer.card_sent(@sender).deliver_later
      CardMailer.thank_you(@sender).deliver_later
    end
    redirect_to :new_card
  end

  private

  def sender_params
    params.require(:sender).permit(:name, :email, :address, :city, :state, :zip, cards_attributes: [:name, :address, :city, :state, :zip, :comment, {gif: []}])
  end
end
