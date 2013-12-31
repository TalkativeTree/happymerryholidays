class CardsController < ApplicationController

  before_action :set_namespace

  def new
    @card = Card.new
    @partial = 'form'
    render @type
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to action: 'show', type: @type, url: @card.url
    else
      render @type
    end
  end

  def show
    print params
    @partial = 'show'
    @card = Card.where(url: params[:url]).first
    puts @card.inspect
    render @type
  end

  private
  def set_namespace
    @type = if ["christmas", "thanksgiving", "hannukah"].include?(params[:type])
              params[:type]
            else
              '/'
            end
  end
private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def card_params
      params.require(:card).permit(:url, :message, :to_email, :subject)
    end
end