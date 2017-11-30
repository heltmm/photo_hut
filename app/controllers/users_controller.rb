class UsersController < ApplicationController
  def show
    @tags = current_user.tags
    @images = []
    @tags.each do |tag|
      @images.push(Image.find(tag.image_id))
    end
  end
end
