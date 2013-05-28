class UserProfileController < ApplicationController
  def show
    @person = current_registry.person
  end

  def upload_photo
    @person = current_registry.person
    if params[:upload]
      name = @person.email + params[:upload].original_filename

      directory = 'public/people/'
      path = File.join(directory, name)

      File.open(path, 'wb') { |f| f.write(params[:upload].read) }
      @person.update_attribute(:photo, name)
    else
      puts "Delete file."
      File.delete("public/people/"+@person.photo)
      @person.update_attribute(:photo, nil)
    end


  end
end
