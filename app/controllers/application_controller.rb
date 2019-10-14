# frozen_string_literal: true
class ApplicationController < ActionController::Base
  helper_method :avatar

  #Allows us to grab current_user profile pic in all cases (if there is no attached avatars, we display a default avatar)
  def avatar(avatar_holder)
      if avatar_holder.avatar.attached?
          avatar = avatar_holder.avatar
      else
          avatar = "https://arena-fighter.s3.eu-west-3.amazonaws.com/avatar.jpg"
      end
  end
end
