class CupsTotalController < ApplicationController
    before_action :authenticate_user

    def index
        @cups_total = current_user.cups_total
        render json: @cups_total
    end

    def index_all
        @cups_total = CupsTotal.all
        render json: @cups_total
    end

end
