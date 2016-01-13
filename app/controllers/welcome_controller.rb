class WelcomeController < ApplicationController
  def index
    if current_user
      media = current_user.media.order(posted_at: :desc)
      @media = media[0...15]
    end
  end

  def filter
    filter = params[:filter]

    @media = []

    current_user.media.each do |medium|
      if medium.handle.provider == filter
        @media << medium
      end
    end

    render :index
  end
end
