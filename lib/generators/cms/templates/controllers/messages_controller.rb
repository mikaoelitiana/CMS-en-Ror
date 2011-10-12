# -*- encoding : utf-8 -*-
class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      #ContactMailer.to_frontline(@message).deliver
      #ContactMailer.to_sender(@message).deliver
      flash[:notice] =  "Nous vous remercions pour votre message.<br />à très bientôt.".html_safe
      redirect_to root_path
    else
      load_container("messages#new")
      flash[:error] = "<ul>Veuillez vérifier votre message:<br /><li>#{@message.errors.full_messages.join("</li><li>")}</li></ul>".html_safe
      render :action => :new
    end
  end
end
