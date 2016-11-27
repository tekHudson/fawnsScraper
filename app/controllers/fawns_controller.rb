class FawnsController < ApplicationController
  def scrape_fawn
    fawn_id = params[:fawn_id].to_s

    begin
      @fawn = Fawn.find fawn_id
    rescue ActiveRecord::RecordNotFound => e
      @fawn = Fawn.create!(Fawn.build_attributes(fawn_id))
    end

    render :json => @fawn if @fawn.present?
  end
end
