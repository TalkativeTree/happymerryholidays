class CardsController < ApplicationController

  before_action :set_type

  def new
    @card = Card.new
    @partial = 'partials/form'
    render @type
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to action: 'show', type: @type, url: @card.url
    else
      @partial = 'partials/form'
      render @type
    end
  end

  def show
    puts params
    @partial = 'partials/show'
    @card = Card.where(url: params[:url]).first
    if @card
      render @type
    else
       render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

  private
  def set_type
    @type = if ["christmas", "thanksgiving", "hannukah"].include?(params[:type])
              params[:type]
            else
              '/'
            end
  end

  def card_params
    params.require(:card).permit(:url, :message, :to_email, :subject)
  end
end