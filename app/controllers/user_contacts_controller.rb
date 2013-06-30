class UserContactsController < ApplicationController
  before_filter :authenticate_registry!

  def send_request
    @requested = Person.find(params[:id])
    @requester = current_registry.person

    @pending_contact = PendingContact.new(:requester_id => @requester.id, :requested_id => @requested.id);
    @pending_contact.save

    respond_to do |format|
      format.js # send_request.js.erb
    end
  end


  def show_pending_contact
    @participant = Person.find(params[:id]);
    @interests = @participant.area_of_interests

    respond_to do |format|
      format.js # send_request.js.erb
    end
  end

  def reject_request
    @participant = Person.find(params[:id]);

    @pending = PendingContact.where(:requester_id => @participant.id, :requested_id => current_registry.person.id).first;
    @pending.destroy

    @rejected = RejectedContact.new(:requester_id => @participant.id, :requested_id => current_registry.person.id);
    @rejected.save

    respond_to do |format|
      format.js # reject_request.js.erb
    end
  end

  def accept_request
    @participant = Person.find(params[:id]);

    @pending = PendingContact.where(:requester_id => @participant.id, :requested_id => current_registry.person.id).first;
    @pending.destroy

    @traded = TradedContact.new(:requester_id => @participant.id, :requested_id => current_registry.person.id);
    @traded.save
    respond_to do |format|
      format.js # accept_request.js.erb
    end
  end

  def export
    # DONT CHANGE TO '' !!!!!!!! \r\n STOPS WORKING!!!!!!!
    received = current_registry.person.received_traded_contacts
    sent = current_registry.person.sent_traded_contacts
    x=""
    received.each do |r|
      a = ""
      a+= (r.requester.full_name) + " "
      a+= (r.requester.email)
      if r.requester.infos.any?
        b=""
        r.requester.infos.each do |i|
          c= "\r\n          "
          c+= i.info_type
          c+= " - "
          c+= i.value
          b=b+c
        end
        a=a+b+"\r\n"

      end
      x+=a+"\r\n"
    end
    sent.each do |s|
      a = ""
      a+= (s.requested.full_name) + " "
      a+= (s.requested.email)
      if s.requested.infos.any?
        b=""
        s.requested.infos.each do |i|
          c= "\r\n          "
          c+= i.info_type
          c+= " - "
          c+= i.value
          b=b+c
        end
        a=a+b+"\r\n"

      end
      x+=a+"\r\n"

    end
    send_data(x, :filename => "contacts.txt")
  end

  def export_csv
    # DONT CHANGE TO '' !!!!!!!! \r\n STOPS WORKING!!!!!!!
    received = current_registry.person.received_traded_contacts
    sent = current_registry.person.sent_traded_contacts
    x='"First Name","Last Name","Email","Phone","Address","Facebook","LinkedIn","Twitter","Youtube","Website","Other","Empty Type"'
    x+= "\r\n"
    received.each do |r|
      b=Array.new(12) { Array.new }
      b[0].append(r.requester.first_name)
      b[1].append(r.requester.last_name)
      b[2].append(r.requester.email)

      if r.requester.infos.any?
        r.requester.infos.each do |i|
          if (i.info_type == "Email")
            b[2].append(i.value)
          end
          if (i.info_type == "Phone")
            b[3].append(i.value)
          end
          if (i.info_type == "Address")
            b[4].append(i.value)
          end
          if (i.info_type == "Facebook")
            b[5].append(i.value)
          end
          if (i.info_type == "LinkedIn")
            b[6].append(i.value)
          end
          if (i.info_type == "Twitter")
            b[7].append(i.value)
          end
          if (i.info_type == "Youtube")
            b[8].append(i.value)
          end
          if (i.info_type == "Website")
            b[9].append(i.value)
          end
          if (i.info_type == "Other")
            b[10].append(i.value)
          end
          if (i.info_type == "Empty Type")
            b[11].append(i.value)
          end
        end
      end

      b.each_with_index do |pos, i|
        x+=''
        b[i].each do |input|
          x+=''+input+' '
        end
        x+=','
      end

      x+= "\r\n"
    end
    sent.each do |r|
      b=Array.new(12) { Array.new }
      b[0].append(r.requested.first_name)
      b[1].append(r.requested.last_name)
      b[2].append(r.requested.email)

      if r.requested.infos.any?
        r.requested.infos.each do |i|
          if (i.info_type == "Email")
            b[2].append(i.value)
          end
          if (i.info_type == "Phone")
            b[3].append(i.value)
          end
          if (i.info_type == "Address")
            b[4].append(i.value)
          end
          if (i.info_type == "Facebook")
            b[5].append(i.value)
          end
          if (i.info_type == "LinkedIn")
            b[6].append(i.value)
          end
          if (i.info_type == "Twitter")
            b[7].append(i.value)
          end
          if (i.info_type == "Youtube")
            b[8].append(i.value)
          end
          if (i.info_type == "Website")
            b[9].append(i.value)
          end
          if (i.info_type == "Other")
            b[10].append(i.value)
          end
          if (i.info_type == "Empty Type")
            b[11].append(i.value)
          end
        end
      end

      b.each_with_index do |pos, i|
        x+=''
        b[i].each do |input|
          x+='"'+input+'"'
        end
        x+=','
      end
      x+= "\r\n"
    end
    send_data(x, :filename => "contacts.csv")
  end

  def cancel_rejection
    @rejected = RejectedContact.where(:requester_id => params[:id], :requested_id => current_registry.person_id).first;
    if @rejected
      @traded = TradedContact.new(:requester_id => params[:id], :requested_id => current_registry.person_id);
      @traded.save
      @rejected.destroy
      @done=true
    else
      @done=false
    end
    respond_to do |format|
      format.js
    end
  end
end

