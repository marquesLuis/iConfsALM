class UserProfileController < ApplicationController
  before_filter :authenticate_registry!
  def show
    @person=current_registry.person
    @interests = PersonInterest.where(:person_id => current_registry.person_id)

    #seguinte é necessario para por checkboxes a true.
    x=[]
    @interests.each do |i|
      x.append(i.area_of_interest_id)
    end
    if x.length==0
      @otherInterests =AreaOfInterest.all
    else
      @otherInterests = AreaOfInterest.where('id not in (?)', x)
    end


  end

  def upload_photo

    @person = current_registry.person
    @interests = PersonInterest.where(:person_id => @person.id)
    x=[]
    @interests.each do |i|
      x.append(i.area_of_interest_id)
    end
    if x.length==0
      @otherInterests =AreaOfInterest.all
    else
      @otherInterests = AreaOfInterest.where('id not in (?)', x)
    end

    if params[:upload]
      name = @person.email + params[:upload].original_filename

      directory = 'public/people/'
      path = File.join(directory, name)

      File.open(path, 'wb') { |f| f.write(params[:upload].read) }
      @person.update_attribute(:photo, name)
    else
      File.delete("public/people/"+@person.photo)
      @person.update_attribute(:photo, nil)
    end


  end

  def update_interests
    PersonInterest.where(:person_id => current_registry.person.id).destroy_all
      params[:interests].each do |interest|
        pi = PersonInterest.new(:person_id => current_registry.person.id, :area_of_interest_id => interest)
        pi.save
      end

      respond_to do |format|
        format.js # update_interests.js.erb
      end
  end

  def update_biography
    current_registry.person.update_attribute(:biography, params[:biography])
  end

  def update_theme
    current_registry.person.update_attribute(:theme, params[:theme])
  end
end
