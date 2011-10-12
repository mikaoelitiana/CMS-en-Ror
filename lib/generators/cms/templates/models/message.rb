# -*- encoding : utf-8 -*-
class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  Civilities = [ "Mr", "Mme", "Mlle" ]

  attr_accessor :sender_civility,
    :sender_lastname,
    :sender_firstname,
    :sender_organisation,
    :sender_phone,
    :sender_email,
    :sender_email_confirmation,
    :sender_country,
    :content,
    :subject,
    :newsletter_subscription

  validates_presence_of :sender_civility,
    :sender_lastname,
    :sender_firstname,
    :sender_organisation,
    :sender_phone,
    :sender_email,
    :sender_country,
    :content,
    :subject

  validates_format_of :sender_email, :with => /.*@.*/

  def initialize(params = {})
    params.each do |name, value|
      self.send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  private
  def validates
    self.errors.add(:sender_email_confirmation) if self.sender_email_confirmation != ""
  end
end
