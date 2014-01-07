class Card < ActiveRecord::Base
  @reserved_words = ["new","create","show"]

  validate :url, presence: true
  validate :url, uniqueness: true
  validates :url, :exclusion => { :in => @reserved_words, :message => "\"%{value}\" is reserved."}

  validate :message, presence: true
  after_validation :default_values

  protected
  def default_values
    if no_url?
      self.url = SecureRandom.hex(5)
    end
  end

  def no_url?
    self.url.length < 1 || self.url == ''
  end
end