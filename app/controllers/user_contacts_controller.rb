class UserContactsController < ApplicationController
  before_filter :authenticate_registry!

  def send_request
    @requested = Person.find(params[:id])
    @requester = current_registry.person

    @pending_contact = PendingContact.new(:requester_id => @requester.id, :requested_id=>@requested.id);
    @pending_contact.save

    respond_to do |format|
      format.js # send_request.js.erb
    end
  end


  def show_pending_contact
    @participant = Person.find(params[:id]);

    respond_to do |format|
      format.js # send_request.js.erb
    end
  end

  def reject_request
    @participant = Person.find(params[:id]);

    @pending = PendingContact.where(:requester_id => @participant.id, :requested_id => current_registry.person.id).first;
    @pending.destroy

    @rejected =  RejectedContact.new(:requester_id => @participant.id, :requested_id=>current_registry.person.id);
    @rejected.save

    respond_to do |format|
      format.js # reject_request.js.erb
    end
  end

  def accept_request
    @participant = Person.find(params[:id]);

    @pending = PendingContact.where(:requester_id => @participant.id, :requested_id => current_registry.person.id).first;
    @pending.destroy

    @traded = TradedContact.new(:requester_id => @participant.id, :requested_id=>current_registry.person.id);
    @traded.save
    respond_to do |format|
      format.js # accept_request.js.erb
    end
  end
end

